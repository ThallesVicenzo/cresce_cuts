import 'package:cresce_cuts/core/enums/discount_types.dart';

abstract class SendProductDataSource {
  Future<String?> call({
    required String discountTitle,
    required String description,
    required DiscountType discountType,
    required double initialPrice,
    required double finalPrice,
    required double? price,
    required DateTime activationDate,
    required DateTime inactivationDate,
    required String image,
  });
}

abstract class EditProductDataSource {
  Future<String?> call({
    required String discountTitle,
    required String description,
    required DiscountType discountType,
    required double initialPrice,
    required double finalPrice,
    required double? price,
    required DateTime activationDate,
    required DateTime inactivationDate,
    required String image,
    required int index,
  });
}
