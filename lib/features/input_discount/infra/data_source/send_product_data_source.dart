import 'package:cresce_cuts/core/enums/discount_types.dart';

abstract class SendProductDataSource {
  Future<String?> call({
    required String discountTitle,
    required String description,
    required DiscountType discountType,
    required double initialPrice,
    required double finalPrice,
    required DateTime activationDate,
    required DateTime inactivationDate,
    required String image,
  });
}