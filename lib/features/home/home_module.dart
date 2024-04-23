import 'package:cresce_cuts/features/home/domain/repository/products_repository.dart';
import 'package:cresce_cuts/features/home/domain/use_case/products_use_case.dart';
import 'package:cresce_cuts/features/home/external/products_data_source_impl.dart';
import 'package:cresce_cuts/features/home/home_routes.dart';
import 'package:cresce_cuts/features/home/infra/data_source/products_data_source.dart';
import 'package:cresce_cuts/features/home/infra/repository/products_repository_impl.dart';
import 'package:cresce_cuts/features/home/presenter/controllers/home_controller.dart';
import 'package:cresce_cuts/features/home/presenter/controllers/home_details_controller.dart';
import 'package:cresce_cuts/features/home/presenter/pages/home_details_page.dart';
import 'package:cresce_cuts/features/home/presenter/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/domain/entities/product_entity.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.add<ProductsUseCase>(ProductsUsecaseImp.new);
    i.add<ProductsRepository>(ProductsRepositoryImpl.new);
    i.addInstance<ProductsDataSource>(ProductsDataSourceImpl(
      storage: Modular.get(
        key: 'storage',
      ),
    ));
    i.add<HomeController>(HomeController.new);
    i.add<HomeDetailsController>(HomeDetailsController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      HomeRoutes.homePage.route,
      child: (context) => HomePage(
        controller: context.read<HomeController>(),
      ),
    );
    r.child(
      HomeRoutes.homeDetailsPage.route,
      transition: TransitionType.rightToLeft,
      child: (context) => HomeDetailsPage(
        controller: context.read<HomeDetailsController>(),
        productEntity: r.args.data['product'] as ProductEntity,
      ),
    );
  }
}
