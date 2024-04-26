import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/colors_palette.dart';

class AppSwitch extends StatelessWidget {
  const AppSwitch({
    super.key,
    required this.onChanged,
    required this.value,
  });

  final bool value;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: CupertinoSwitch(
        activeColor: ColorsPalette.skyBlue.withOpacity(0.3),
        thumbColor: value ? ColorsPalette.skyBlue : Colors.white,
        trackColor: ColorsPalette.defaultBorder,
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
