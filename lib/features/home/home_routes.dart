import 'package:cresce_cuts/core/main_routes.dart';

enum HomeRoutes {
  homePage('/'),
  homeDetailsPage('/home-details-page');

  const HomeRoutes(this.route);

  final String route;

  String get path => MainRoutes.home.route + route;
}
