import 'package:design_system/widgets/colors/ui_overlay_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      routerConfig: Modular.routerConfig,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Rubik',
      ),
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context)
                .removeCurrentSnackBar(reason: SnackBarClosedReason.swipe);
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: UiOverlayColor(
            child: child!,
          ),
        );
      },
    );
  }
}
