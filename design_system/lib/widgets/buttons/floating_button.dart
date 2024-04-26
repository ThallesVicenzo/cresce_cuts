import 'package:design_system/widgets/colors/colors_palette.dart';
import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton(
      {super.key, this.size, required this.title, required this.onPressed});

  final Size? size;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: ColorsPalette.defaultBorder,
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: TextButton(
          onPressed: onPressed,
          child: Container(
            height: size?.height,
            width: size?.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorsPalette.skyBlue,
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
