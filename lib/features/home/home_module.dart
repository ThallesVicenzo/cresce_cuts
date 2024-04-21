import 'package:cresce_cuts/core/enums/discount_types.dart';
import 'package:cresce_cuts/features/home/home_routes.dart';
import 'package:cresce_cuts/features/home/presenter/controllers/home_controller.dart';
import 'package:cresce_cuts/features/home/presenter/pages/home_page.dart';
import 'package:cresce_cuts/features/home/presenter/pages/input_discount_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/domain/entities/product_entity.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.add<HomeController>(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      HomeRoutes.homePage.route,
      child: (context) => HomePage(
        controller: context.read<HomeController>(),
        products: r.args.data['products'] as List<ProductEntity>,
      ),
    );
    r.child(
      HomeRoutes.inputDiscountPage.route,
      transition: TransitionType.rightToLeft,
      child: (context) => InputDiscountPage(
        discountType: r.args.data['discount'] as DiscountType,
      ),
    );
  }
}
