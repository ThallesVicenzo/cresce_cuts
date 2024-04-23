import 'package:cresce_cuts/features/splash/presenter/controllers/splash_controller.dart';
import 'package:cresce_cuts/features/splash/splash_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/splash_page.dart';

class SplashModule extends Module {
  @override
  void binds(i) {
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
