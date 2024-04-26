import 'package:cresce_cuts/core/main_routes.dart';

enum InputDiscountRoutes {
  inputDiscountPage('/');

  const InputDiscountRoutes(this.route);

  final String route;

  String get path => MainRoutes.inputDiscount.route + route;
}
