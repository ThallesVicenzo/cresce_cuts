import 'package:cresce_cuts/core/main_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashController extends ChangeNotifier {
  final opacity = ValueNotifier<double>(1);

  void onAnimationEd(double value) {
    if (value == 0) {
      Modular.to.navigate(
        MainRoutes.home.route,
      );
    }
  }
}
