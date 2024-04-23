import 'package:design_system/widgets/colors/colors_palette.dart';
import 'package:flutter/material.dart';

class HighlightedText extends StatelessWidget {
  const HighlightedText({
    super.key,
    required this.text,
    this.fontSize = 12,
    this.fontWeight,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: ColorsPalette.skyBlue,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
