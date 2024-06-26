import 'package:cresce_cuts/core/enums/discount_types.dart';
import 'package:design_system/widgets/buttons/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'select_discount_type_widget.dart';

class SelectDiscountDialog extends StatelessWidget {
  const SelectDiscountDialog({
    super.key,
    required this.discountType,
    required this.onPressed,
  });

  final ValueNotifier<DiscountType> discountType;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text(
          'Por favor, escolha o tipo de desconto',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: SelectedDiscountTypeWidget(
          discountType: discountType.value,
          onTap: (value) {
            setState(() {
              discountType.value = value;
            });
          },
        ),
        actions: [
          DefaultButton(
            size: const Size(60, 40),
            title: 'Aceitar',
            onPressed: onPressed,
          ),
          TextButton(
            onPressed: () {
              Modular.to.pop();
            },
            child: const Text(
              'Voltar',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
