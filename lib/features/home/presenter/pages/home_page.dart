import 'package:cresce_cuts/core/domain/entities/product_entity.dart';
import 'package:cresce_cuts/core/enums/discount_types.dart';
import 'package:cresce_cuts/core/page_state.dart';
import 'package:design_system/pages/default_erro_page.dart';
import 'package:design_system/widgets/app_bar/default_app_bar.dart';
import 'package:design_system/widgets/buttons/floating_button.dart';
import 'package:design_system/widgets/colors/colors_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/main_routes.dart';
import '../controllers/home_controller.dart';
import '../widgets/home_widgets/discount_info.dart';
import '../widgets/home_widgets/select_discount_dialog.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;
  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  State<HomePage> createState() => _SplashScreen();
}

class _SplashScreen extends State<HomePage> {
  @override
  void initState() {
    widget.controller.state.addListener(listenableErrorState);
    widget.controller.callData();
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

  final ValueNotifier<DiscountType> discountType =
      ValueNotifier<DiscountType>(DiscountType.perPrice);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Descontos',
        hasLeading: false,
      ),
      body: ValueListenableBuilder<PageState<List<ProductEntity>>>(
          valueListenable: widget.controller.state,
          builder: (context, state, child) {
            if (state is LoadingState) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: ColorsPalette.skyBlue,
                  ),
                ],
              );
            }
            return Padding(
              padding: const EdgeInsets.only(
                bottom: 40,
                right: 20,
                left: 20,
              ),
              child: RefreshIndicator(
                onRefresh: widget.controller.callData,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Visibility(
                        visible: state.asSuccess.isEmpty,
                        child: const Center(
                          heightFactor: 30,
                          child: Text(
                            'Você não possui produtos cadastrados para o desconto.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        itemCount: state.asSuccess.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: DiscountInfo(
                              controller: widget.controller,
                              entity: state.asSuccess[index],
                              index: index,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 60,
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingButton(
        size: const Size(double.infinity, 56),
        title: 'Cadastrar desconto',
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) =>
                SelectDiscountDialog(discountType: discountType),
          );
        },
      ),
    );
  }
}
