import 'package:cresce_cuts/core/domain/errors/response_error.dart';
import 'package:cresce_cuts/core/enums/discount_types.dart';
import 'package:cresce_cuts/features/input_discount/domain/repository/send_product_repository.dart';
import 'package:either_dart/either.dart';

abstract class EditProductUseCase {
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

class EditProductUsecaseImpl implements EditProductUseCase {
  final EditProductRepository repository;

  EditProductUsecaseImpl({required this.repository});

  @override
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
  }) async {
    return await repository.call(
      discountTitle: discountTitle,
      description: description,
      discountType: discountType,
      initialPrice: initialPrice,
      finalPrice: finalPrice,
      price: price,
      activationDate: activationDate,
      inactivationDate: inactivationDate,
      image: image,
      index: index,
    );
  }
}
