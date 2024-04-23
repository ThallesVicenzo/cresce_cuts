import 'package:cresce_cuts/core/client/client_http_exception.dart';
import 'package:cresce_cuts/core/domain/entities/product_entity.dart';
import 'package:cresce_cuts/core/domain/errors/response_error.dart';
import 'package:either_dart/either.dart';

import '../../domain/repository/products_repository.dart';
import '../data_source/products_data_source.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsDataSource dataSource;

  ProductsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<ResponseError, List<ProductEntity>>> call() async {
    try {
      final data = await dataSource.call();
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
