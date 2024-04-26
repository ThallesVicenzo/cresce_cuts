import 'dart:io';

import 'package:design_system/widgets/colors/colors_palette.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../controllers/input_discount_controller.dart';

class UploadImageBox extends StatelessWidget {
  const UploadImageBox({
    super.key,
    required this.controller,
  });

  final InputDiscountController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.getImage();
      },
      child: ValueListenableBuilder<File>(
        valueListenable: controller.file,
        builder: (context, file, child) {
          if (file.path.isEmpty) {
            return DottedBorder(
              radius: const Radius.circular(10),
              dashPattern: const [5],
              borderType: BorderType.RRect,
              color: ColorsPalette.defaultBorder,
              child: const SizedBox(
                height: 200,
                child: Center(
                  child: Icon(
                    Icons.cloud_upload_outlined,
                    size: 70,
                    color: ColorsPalette.lightDark,
                  ),
                ),
              ),
            );
          }
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(file),
              ),
            ),
            height: 200,
          );
        },
      ),
    );
  }
}
