import 'package:cresce_cuts/features/splash/domain/repository/products_repository.dart';
import 'package:cresce_cuts/features/splash/domain/use_case/products_use_case.dart';
import 'package:cresce_cuts/features/splash/external/products_data_source_impl.dart';
import 'package:cresce_cuts/features/splash/infra/data_source/products_data_source.dart';
import 'package:cresce_cuts/features/splash/infra/repository/products_repository_impl.dart';
import 'package:cresce_cuts/features/splash/presenter/controllers/splash_controller.dart';
import 'package:cresce_cuts/features/splash/splash_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/splash_page.dart';

class SplashModule extends Module {
  @override
  void binds(i) {
    i.add<ProductsUseCase>(ProductsUsecaseImp.new);
    i.add<ProductsRepository>(ProductsRepositoryImpl.new);
    i.addInstance<ProductsDataSource>(
      ProductsDataSourceImpl(storage: Modular.get(key: 'storage')),
    );
    i.add<SplashController>(SplashController.new);
  }

  @override
  void routes(r) {
    r.child(
      SplashRoutes.splashPage.route,
      child: (context) => SplashPage(
        controller: context.read<SplashController>(),
      ),
    );
  }
}
