import 'package:cresce_cuts/core/enums/discount_types.dart';
import 'package:design_system/widgets/text%20fields/app_text_form_field.dart';
import 'package:flutter/material.dart';

import '../controllers/input_discount_controller.dart';

class InputDiscountFields extends StatefulWidget {
  const InputDiscountFields({
    super.key,
    required this.controller,
    required this.discountType,
  });

  final InputDiscountController controller;
  final DiscountType discountType;

  @override
  State<InputDiscountFields> createState() => _InputDiscountFieldsState();
}

class _InputDiscountFieldsState extends State<InputDiscountFields> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Form(
            key: widget.controller.formKeys[2],
            autovalidateMode: AutovalidateMode.always,
            child: AppTextFormField(
              label: widget.controller.leftFieldLabel(widget.discountType),
              inputFormatters:
                  widget.controller.setLeftFieldFormatters(widget.discountType),
              keyboardType: TextInputType.number,
              controller: widget.controller.fieldsControllers[2],
              validator: (p0) =>
                  widget.controller.fieldsControllers[2].text.isEmpty
                      ? ''
                      : null,
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Flexible(
          child: Form(
            key: widget.controller.formKeys[3],
            autovalidateMode: AutovalidateMode.always,
            child: AppTextFormField(
              label: widget.controller.rightFieldLabel(widget.discountType),
              inputFormatters: widget.controller
                  .setRightFieldFormatters(widget.discountType),
              sufix: widget.discountType.name == 'Percentual'
                  ? const Icon(
                      Icons.percent,
                      size: 18,
                    )
                  : null,
              keyboardType: TextInputType.number,
              controller: widget.controller.fieldsControllers[3],
              validator: (p0) =>
                  widget.controller.fieldsControllers[3].text.isEmpty
                      ? ''
                      : null,
            ),
          ),
        ),
      ],
    );
  }
}
