import 'package:cresce_cuts/core/domain/errors/response_error.dart';
import 'package:cresce_cuts/core/enums/discount_types.dart';
import 'package:either_dart/either.dart';

abstract class SendProductRepository {
  Future<Either<ResponseError, String?>> call({
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

abstract class EditProductRepository {
  Future<Either<ResponseError, String?>> call({
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
