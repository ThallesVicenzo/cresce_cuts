import 'package:cresce_cuts/core/domain/entities/product_entity.dart';
import 'package:cresce_cuts/core/enums/discount_types.dart';
import 'package:cresce_cuts/core/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class HomeDetailsController extends ChangeNotifier {
  String getDiscount(ProductEntity entity) {
    switch (entity.discount) {
      case DiscountType.perPrice:
        return 'Economize ${'${entity.initialPrice - entity.finalPrice}'.asCurrency()}';
      case DiscountType.percentage:
        return '${entity.finalPrice.toInt()}% Desconto';
      case DiscountType.perQuantity:
        return 'Leve ${entity.initialPrice.toInt()} Pague ${entity.finalPrice.toInt()}';
      default:
        return '${entity.initialPrice - entity.finalPrice}';
    }
  }

  String getFinalValue(ProductEntity entity) {
    final percentage = (entity.initialPrice / 100) * entity.finalPrice;

    switch (entity.discount) {
      case DiscountType.perPrice:
        return '${entity.finalPrice}';
      case DiscountType.percentage:
        return '${entity.initialPrice - percentage}';
      case DiscountType.perQuantity:
        return '${entity.price}';
      default:
        return '${entity.finalPrice}';
    }
  }

  String getInitialPrice(ProductEntity entity) {
    switch (entity.discount) {
      case DiscountType.perPrice || DiscountType.percentage:
        return '${entity.initialPrice}';
      case DiscountType.perQuantity:
        return '';
      default:
        return '${entity.initialPrice}';
    }
  }
}
