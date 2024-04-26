import 'dart:async';

import 'package:design_system/enums/app_images.dart';
import 'package:design_system/widgets/image/asset_image_widget.dart';
import 'package:flutter/material.dart';

import '../controllers/splash_controller.dart';

class SplashPage extends StatefulWidget {
  final SplashController controller;
  const SplashPage({
    super.key,
    required this.controller,
  });

  @override
  State<SplashPage> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      widget.controller.opacity.value = 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<double>(
        valueListenable: widget.controller.opacity,
        builder: (context, value, child) => AnimatedOpacity(
          opacity: value,
          duration: kThemeAnimationDuration,
          onEnd: () {
            widget.controller.onAnimationEd(value);
          },
          child: const Center(
            child: AssetImageWidget(
              image: AppImage.logo,
              size: Size(300, 300),
            ),
          ),
        ),
      ),
    );
  }
}
