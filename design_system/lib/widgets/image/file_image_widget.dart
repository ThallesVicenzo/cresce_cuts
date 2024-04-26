import 'dart:io';

import 'package:design_system/widgets/colors/colors_palette.dart';
import 'package:flutter/cupertino.dart';

class FileImageWidget extends StatelessWidget {
  final File file;
  final Size size;
  final BoxFit fit;
  final Alignment alignment;
  final String? package;

  const FileImageWidget({
    super.key,
    required this.file,
    this.size = const Size(24, 24),
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.package = 'design_system',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: ColorsPalette.defaultBorder,
        ),
      ),
      child: Image.file(
        file,
        width: size.width,
        height: size.height,
        fit: fit,
        alignment: alignment,
      ),
    );
  }
}
