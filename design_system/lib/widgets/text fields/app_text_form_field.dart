import 'package:design_system/widgets/colors/colors_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/values/finals.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.height,
    this.validator,
    this.errorText,
    this.onChanged,
    this.maxLines = 1,
    this.onTap,
    this.canFocus = true,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.initialValue,
  });

  final String? label;
  final String? hintText;
  final String? errorText;
  final String? initialValue;
  final double? height;
  final int? maxLines;
  final bool canFocus;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: label != null ? true : false,
          child: Row(
            children: [
              Text(
                label ?? '',
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          onTap: onTap,
          canRequestFocus: canFocus,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLines: maxLines,
          expands: maxLines == null ? true : false,
          validator: validator,
          cursorColor: ColorsPalette.skyBlue,
          onChanged: onChanged,
          decoration: InputDecoration(
            errorText: errorText,
            isCollapsed: maxLines == null ? true : false,
            contentPadding: const EdgeInsets.all(8),
            errorBorder: outlineBorder,
            border: outlineBorder,
            constraints: BoxConstraints(maxHeight: height ?? 48),
            hintText: hintText,
            disabledBorder: outlineBorder,
            enabledBorder: outlineBorder,
            focusedBorder: outlineBorder,
          ),
        ),
      ],
    );
  }
}
