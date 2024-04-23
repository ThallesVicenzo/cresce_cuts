import 'package:cresce_cuts/core/client/client_http_exception.dart';
import 'package:cresce_cuts/core/domain/errors/response_error.dart';
import 'package:cresce_cuts/core/enums/discount_types.dart';
import 'package:cresce_cuts/features/input_discount/domain/repository/send_product_repository.dart';
import 'package:cresce_cuts/features/input_discount/infra/data_source/send_product_data_source.dart';
import 'package:either_dart/either.dart';

class SendProductRepositoryImpl implements SendProductRepository {
  final SendProductDataSource dataSource;

  SendProductRepositoryImpl({required this.dataSource});

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
  }) async {
    try {
      final data = await dataSource.call(
        discountTitle: discountTitle,
        description: description,
        discountType: discountType,
        price: price,
        initialPrice: initialPrice,
        finalPrice: finalPrice,
        activationDate: activationDate,
        inactivationDate: inactivationDate,
        image: image,
      );
      return Right(data);
    } on ClientHttpException catch (e) {
      return Left(
        ResponseClientError(
          exception: e,
          errorCode: e.statusCode,
          errorMessage: e.message,
        ),
      );
    } catch (e) {
      return Left(
        ResponseGenericError(
          error: e,
        ),
      );
    }
  }
}
