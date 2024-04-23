import 'dart:io';

import 'package:cresce_cuts/core/utils/extensions/date_time_extension.dart';
import 'package:cresce_cuts/features/home/home_routes.dart';
import 'package:design_system/enums/app_icons.dart';
import 'package:design_system/widgets/colors/colors_palette.dart';
import 'package:design_system/widgets/icon/asset_icon_widget.dart';
import 'package:design_system/widgets/image/file_image_widget.dart';
import 'package:design_system/widgets/switch/app_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/domain/entities/product_entity.dart';
import '../../controllers/home_controller.dart';

class DiscountInfo extends StatelessWidget {
  const DiscountInfo({
    super.key,
    required this.controller,
    required this.entity,
    required this.index,
  });

  final HomeController controller;
  final ProductEntity entity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: ColorsPalette.defaultBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) => AppSwitch(
                    value: entity.activationDate.isTodayDate,
                    onChanged: (tap) {
                      controller.tapSwitch(tap, index);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FileImageWidget(
                  file: File(entity.image),
                  size: const Size(100, 100),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 23,
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        entity.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Desconto: ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: entity.discount.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 13,
              bottom: 4,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Data ativação',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      entity.activationDate.formattedDateTimeWithSlash,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Data Inativação',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      entity.inactivationDate.formattedDateTimeWithSlash,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: ColorsPalette.defaultBorder,
          ),
          GestureDetector(
            onTap: () {
              Modular.to.pushNamed(
                HomeRoutes.homeDetailsPage.path,
                arguments: {
                  'product': entity,
                  'index': index,
                },
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ver desconto',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                AssetIconWidget(
                  icon: AppIcons.discount,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
