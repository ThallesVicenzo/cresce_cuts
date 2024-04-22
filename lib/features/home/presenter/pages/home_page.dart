import 'package:cresce_cuts/core/domain/entities/product_entity.dart';
import 'package:cresce_cuts/core/enums/discount_types.dart';
import 'package:cresce_cuts/core/page_state.dart';
import 'package:design_system/pages/default_erro_page.dart';
import 'package:design_system/widgets/app_bar/default_app_bar.dart';
import 'package:design_system/widgets/buttons/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/main_routes.dart';
import '../controllers/home_controller.dart';
import '../widgets/home_widgets/discount_info.dart';
import '../widgets/home_widgets/select_discount_dialog.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;
  final List<ProductEntity> products;
  const HomePage({
    super.key,
    required this.controller,
    required this.products,
  });

  @override
  State<HomePage> createState() => _SplashScreen();
}

class _SplashScreen extends State<HomePage> {
  @override
  void initState() {
    widget.controller.state.addListener(listenableErrorState);
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 40,
            right: 20,
            left: 20,
          ),
          child: Column(
            children: [
              Visibility(
                visible: widget.products.isEmpty,
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
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  return DiscountInfo(
                    controller: widget.controller,
                    entity: widget.products[index],
                  );
                },
              ),
              const Spacer(),
              DefaultButton(
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
            ],
          ),
        ),
      ),
    );
  }
}
