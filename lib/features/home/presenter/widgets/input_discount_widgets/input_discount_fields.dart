import 'package:cresce_cuts/core/enums/discount_types.dart';
import 'package:design_system/widgets/text%20fields/app_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../controllers/input_discount_controller.dart';

class InputDiscountFields extends StatelessWidget {
  const InputDiscountFields({
    super.key,
    required this.controller,
    required this.discountType,
  });

  final InputDiscountController controller;
  final DiscountType discountType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: AppTextFormField(
            label: controller.leftFieldLabel(discountType),
            inputFormatters: controller.setLeftFieldFormatters(discountType),
            keyboardType: TextInputType.number,
            controller: controller.fieldsControllers[2],
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Flexible(
          child: AppTextFormField(
            label: controller.rightFieldLabel(discountType),
            inputFormatters: controller.setRightFieldFormatters(discountType),
            sufix: discountType.name == 'Percentual'
                ? const Icon(
                    Icons.percent,
                    size: 18,
                  )
                : null,
            keyboardType: TextInputType.number,
            controller: controller.fieldsControllers[3],
          ),
        ),
      ],
    );
  }
}
