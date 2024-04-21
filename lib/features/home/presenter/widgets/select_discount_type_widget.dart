import 'package:cresce_cuts/core/enums/discount_types.dart';
import 'package:design_system/widgets/colors/colors_palette.dart';
import 'package:flutter/material.dart';

class SelectedDiscountTypeWidget extends StatelessWidget {
  final DiscountType discountType;
  final void Function(DiscountType) onTap;
  const SelectedDiscountTypeWidget({
    super.key,
    required this.discountType,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const height = 45.0;
    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onTap(DiscountType.perPrice),
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  color: discountType == DiscountType.perPrice
                      ? ColorsPalette.skyBlue
                      : Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    'Por preço',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: discountType == DiscountType.perPrice
                          ? Colors.white
                          : ColorsPalette.skyBlue,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onTap(DiscountType.percentage),
              child: Container(
                height: discountType != DiscountType.percentage
                    ? height - 20
                    : height,
                decoration: BoxDecoration(
                  color: discountType == DiscountType.percentage
                      ? ColorsPalette.skyBlue
                      : Colors.white,
                  borderRadius: discountType == DiscountType.percentage
                      ? BorderRadius.circular(4)
                      : null,
                  border: discountType != DiscountType.percentage
                      ? Border(
                          left: BorderSide(
                            color: discountType == DiscountType.perPrice
                                ? Colors.white
                                : ColorsPalette.defaultBorder,
                            width: 1.5,
                          ),
                          right: BorderSide(
                            color: discountType == DiscountType.perQuantity
                                ? Colors.white
                                : ColorsPalette.defaultBorder,
                            width: 1.5,
                          ),
                        )
                      : null,
                ),
                child: Center(
                  child: Text(
                    'Percentual',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: discountType == DiscountType.percentage
                          ? Colors.white
                          : ColorsPalette.skyBlue,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onTap(DiscountType.perQuantity),
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  color: discountType == DiscountType.perQuantity
                      ? ColorsPalette.skyBlue
                      : Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    'Quantidade',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: discountType == DiscountType.perQuantity
                          ? Colors.white
                          : ColorsPalette.skyBlue,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
