import 'package:cresce_cuts/core/domain/entities/product_entity.dart';
import 'package:cresce_cuts/core/enums/discount_types.dart';
import 'package:cresce_cuts/core/main_routes.dart';
import 'package:cresce_cuts/core/page_state.dart';
import 'package:cresce_cuts/core/utils/masks/mask_formatters.dart';
import 'package:cresce_cuts/features/input_discount/presenter/controllers/input_discount_controller.dart';
import 'package:design_system/pages/default_erro_page.dart';
import 'package:design_system/widgets/app_bar/default_app_bar.dart';
import 'package:design_system/widgets/buttons/floating_button.dart';
import 'package:design_system/widgets/colors/colors_palette.dart';
import 'package:design_system/widgets/text%20fields/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/activation_date_fields.dart';
import '../widgets/input_discount_fields.dart';
import '../widgets/upload_image_box.dart';

class InputDiscountPage extends StatefulWidget {
  const InputDiscountPage({
    super.key,
    required this.discountType,
    required this.controller,
    this.entity,
    this.index,
  });

  final DiscountType discountType;
  final InputDiscountController controller;
  final ProductEntity? entity;
  final int? index;

  @override
  State<InputDiscountPage> createState() => _InputDiscountPageState();
}

class _InputDiscountPageState extends State<InputDiscountPage> {
  @override
  void initState() {
    widget.controller.state.addListener(listenableErrorState);
    widget.controller.getValues(widget.entity);
    super.initState();
  }

  void listenableErrorState() {
    final state = widget.controller.state.value;

    if (state is ErrorState) {
      Modular.to.pushNamed(
        MainRoutes.defaultError.route,
        arguments: ErrorPageParams(
          errorlog: state.asError.message,
          code: state.asError.code.toString(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Cadastro desconto',
        hasLeading: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: widget.controller.state,
        builder: (context, state, child) {
          if (state.isLoading) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child:
                      CircularProgressIndicator(color: ColorsPalette.skyBlue),
                ),
              ],
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 32.0,
                bottom: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: widget.controller.formKeys[0],
                    autovalidateMode: AutovalidateMode.always,
                    child: AppTextFormField(
                      label: 'Nome do desconto',
                      controller: widget.controller.fieldsControllers[0],
                      validator: (p0) =>
                          widget.controller.fieldsControllers[0].text.isEmpty
                              ? ''
                              : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Form(
                      key: widget.controller.formKeys[1],
                      autovalidateMode: AutovalidateMode.always,
                      child: AppTextFormField(
                        label: 'Descrição',
                        maxLines: null,
                        controller: widget.controller.fieldsControllers[1],
                        validator: (p0) =>
                            widget.controller.fieldsControllers[1].text.isEmpty
                                ? ''
                                : null,
                      ),
                    ),
                  ),
                  AppTextFormField(
                    label: 'Tipo do desconto',
                    canFocus: false,
                    initialValue: widget.discountType.name,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InputDiscountFields(
                      controller: widget.controller,
                      discountType: widget.discountType,
                    ),
                  ),
                  Visibility(
                    visible: widget.discountType == DiscountType.perQuantity,
                    child: Form(
                      key: widget.controller.formKeys[6],
                      autovalidateMode: AutovalidateMode.always,
                      child: AppTextFormField(
                        label: 'Preço',
                        controller: widget.controller.fieldsControllers[6],
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          MaskFormatters.maskMoney,
                        ],
                        keyboardType: TextInputType.number,
                        validator: (p0) =>
                            widget.controller.fieldsControllers[6].text.isEmpty
                                ? ''
                                : null,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                    child: ActivationDateFields(controller: widget.controller),
                  ),
                  UploadImageBox(controller: widget.controller),
                  const SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: keyboardIsOpened
          ? null
          : FloatingButton(
              size: const Size(double.infinity, 56),
              title: 'Salvar',
              onPressed: () {
                if (widget.entity != null && widget.index != null) {
                  widget.controller
                      .editDiscount(widget.discountType, widget.index!);
                } else {
                  widget.controller.saveDiscount(widget.discountType);
                }
              },
            ),
    );
  }
}
