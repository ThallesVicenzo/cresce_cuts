import 'package:cresce_cuts/core/utils/masks/mask_formatters.dart';
import 'package:cresce_cuts/features/home/presenter/controllers/input_discount_controller.dart';
import 'package:design_system/widgets/text%20fields/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ActivationDateFields extends StatelessWidget {
  const ActivationDateFields({
    super.key,
    required this.controller,
  });

  final InputDiscountController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: AppTextFormField(
            label: 'Data ativação',
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              MaskFormatters.maskDate,
            ],
            keyboardType: TextInputType.number,
            controller: controller.fieldsControllers[4],
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Flexible(
          child: AppTextFormField(
            label: 'Data Inativação',
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              MaskFormatters.maskDate,
            ],
            keyboardType: TextInputType.number,
            controller: controller.fieldsControllers[5],
          ),
        ),
      ],
    );
  }
}
