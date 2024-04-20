import 'package:cresce_cuts/core/domain/response_error.dart';
import 'package:cresce_cuts/features/splash/domain/entities/product_entity.dart';
import 'package:either_dart/either.dart';

abstract class ProductsRepository {
  Future<Either<ResponseError, List<ProductEntity>>> call();
}
