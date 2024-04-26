import 'package:cresce_cuts/core/utils/masks/mask_formatters.dart';
import 'package:cresce_cuts/features/input_discount/presenter/controllers/input_discount_controller.dart';
import 'package:design_system/widgets/text%20fields/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ActivationDateFields extends StatefulWidget {
  const ActivationDateFields({
    super.key,
    required this.controller,
  });

  final InputDiscountController controller;

  @override
  State<ActivationDateFields> createState() => _ActivationDateFieldsState();
}

class _ActivationDateFieldsState extends State<ActivationDateFields> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: widget.controller.formKeys[4],
            child: AppTextFormField(
              label: 'Data ativação',
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                MaskFormatters.maskDate,
              ],
              keyboardType: TextInputType.number,
              controller: widget.controller.fieldsControllers[4],
              validator: (p0) {
                if (widget.controller.fieldsControllers[4].text.isEmpty ||
                    widget.controller.fieldsControllers[4].text.length <= 9) {
                  return '';
                }
                return null;
              },
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Flexible(
          child: Form(
            key: widget.controller.formKeys[5],
            autovalidateMode: AutovalidateMode.always,
            child: AppTextFormField(
              label: 'Data Inativação',
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                MaskFormatters.maskDate,
              ],
              keyboardType: TextInputType.number,
              controller: widget.controller.fieldsControllers[5],
              validator: (value) {
                if (widget.controller.fieldsControllers[5].text.isEmpty ||
                    widget.controller.fieldsControllers[5].text.length <= 9) {
                  return '';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
