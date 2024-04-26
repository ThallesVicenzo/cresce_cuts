import 'dart:io';

import 'package:cresce_cuts/core/domain/entities/product_entity.dart';
import 'package:cresce_cuts/core/main_routes.dart';
import 'package:cresce_cuts/core/utils/extensions/string_extensions.dart';
import 'package:cresce_cuts/features/home/presenter/controllers/home_details_controller.dart';
import 'package:design_system/widgets/app_bar/default_app_bar.dart';
import 'package:design_system/widgets/buttons/floating_button.dart';
import 'package:design_system/widgets/image/file_image_widget.dart';
import 'package:design_system/widgets/switch/app_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/home_details_widgets/highlighted_text.dart';

class HomeDetailsPage extends StatefulWidget {
  const HomeDetailsPage({
    super.key,
    required this.productEntity,
    required this.controller,
    required this.index,
  });

  final ProductEntity productEntity;
  final int index;
  final HomeDetailsController controller;

  @override
  State<HomeDetailsPage> createState() => _HomeDetailsPageState();
}

class _HomeDetailsPageState extends State<HomeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Detalhe do desconto',
        hasLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppSwitch(
                  onChanged: (value) {},
                  value: widget.productEntity.isActive,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              child: FileImageWidget(
                file: File(widget.productEntity.image),
                size: const Size(335, 335),
              ),
            ),
            HighlightedText(
              text: widget.controller.getDiscount(
                widget.productEntity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  HighlightedText(
                    text: widget.controller
                        .getFinalValue(widget.productEntity)
                        .asCurrency(),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    widget.controller
                        .getInitialPrice(widget.productEntity)
                        .asCurrency(),
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.productEntity.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              widget.productEntity.description,
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingButton(
        size: const Size(double.infinity, 56),
        title: 'Editar desconto',
        onPressed: () {
          Modular.to.pushNamed(
            MainRoutes.inputDiscount.route,
            arguments: {
              'discount': widget.productEntity.discount,
              'product': widget.productEntity,
              'index': widget.index
            },
          );
        },
      ),
    );
  }
}
