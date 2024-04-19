import 'package:design_system/widgets/ui_overlay_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/main_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(MainRoutes.splash.route);
    return MaterialApp.router(
      title: 'Cresce Cuts',
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      builder: (context, child) {
        return UiOverlayColor(
          child: child!,
        );
      },
    );
  }
}
