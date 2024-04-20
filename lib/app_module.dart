import 'package:cresce_cuts/core/client/client_http.dart';
import 'package:cresce_cuts/core/client/dio/dio_client.dart';
import 'package:cresce_cuts/core/main_routes.dart';
import 'package:cresce_cuts/core/secure_storage/secure_storage.dart';
import 'package:cresce_cuts/core/secure_storage/secure_storage_impl.dart';
import 'package:cresce_cuts/features/splash/splash_module.dart';
import 'package:design_system/pages/default_erro_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<ClientHttp>(
      DioClient.new,
      key: 'client',
    );
    i.addSingleton<SecureStorage>(
      SecureStorageImpl.new,
      key: 'storage',
    );
  }

  @override
  void routes(r) {
    r.module(
      MainRoutes.splash.route,
      module: SplashModule(),
    );

    r.child(
      MainRoutes.defaultError.route,
      child: (context) {
        final erroParams = r.args.data is ErrorPageParams
            ? (r.args.data as ErrorPageParams)
            : const ErrorPageParams();
        return DefaultErrorPage(
          params: erroParams,
          onBackStart: () {
            Modular.to.navigate(MainRoutes.home.route);
          },
        );
      },
    );
  }
}
