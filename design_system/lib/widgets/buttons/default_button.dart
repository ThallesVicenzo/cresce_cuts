import 'package:design_system/widgets/colors/colors_palette.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.title,
    this.size,
    this.disable = false,
    required this.onPressed,
  });

  final Size? size;
  final String title;
  final VoidCallback onPressed;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disable,
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: size?.width ?? MediaQuery.of(context).size.width * 0.4,
            minHeight: size?.height ?? 32,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: disable ? Colors.grey : ColorsPalette.skyBlue,
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
    );
  }
}
