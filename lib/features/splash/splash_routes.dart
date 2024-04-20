import 'package:cresce_cuts/core/main_routes.dart';

enum SplashRoutes {
  splashPage('/');

  const SplashRoutes(this.route);

  final String route;

  String get path => MainRoutes.splash.route + route;
}
