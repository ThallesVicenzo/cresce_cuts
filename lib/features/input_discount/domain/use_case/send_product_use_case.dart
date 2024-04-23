import 'package:cresce_cuts/core/domain/errors/response_error.dart';
import 'package:cresce_cuts/core/enums/discount_types.dart';
import 'package:cresce_cuts/features/input_discount/domain/repository/send_product_repository.dart';
import 'package:either_dart/either.dart';

abstract class SendProductUseCase {
  Future<Either<ResponseError, String?>> call({
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

class SendProductUsecaseImpl implements SendProductUseCase {
  final SendProductRepository repository;

  SendProductUsecaseImpl({required this.repository});

  @override
  Future<Either<ResponseError, String?>> call({
    required String discountTitle,
    required String description,
    required DiscountType discountType,
    required double initialPrice,
    required double finalPrice,
    required DateTime activationDate,
    required DateTime inactivationDate,
    required String image,
  }) async {
    return await repository.call(
      discountTitle: discountTitle,
      description: description,
      discountType: discountType,
      initialPrice: initialPrice,
      finalPrice: finalPrice,
      activationDate: activationDate,
      inactivationDate: inactivationDate,
      image: image,
    );
  }
}
