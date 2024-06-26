import 'package:design_system/widgets/text%20fields/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controllers/input_discount_controller.dart';

class InputDiscountFields extends StatefulWidget {
  const InputDiscountFields({
    super.key,
    required this.controller,
    required this.leftLabel,
    this.leftInputFormatters,
    required this.rightLabel,
    this.rightInputFormatters,
    this.sufix,
  });

  final InputDiscountController controller;
  final String leftLabel;
  final List<TextInputFormatter>? leftInputFormatters;
  final String rightLabel;
  final List<TextInputFormatter>? rightInputFormatters;

  final Widget? sufix;

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
              label: widget.leftLabel,
              inputFormatters: widget.leftInputFormatters,
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
              label: widget.rightLabel,
              inputFormatters: widget.rightInputFormatters,
              sufix: widget.sufix,
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
