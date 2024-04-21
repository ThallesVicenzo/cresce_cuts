import 'package:cresce_cuts/core/domain/entities/product_entity.dart';
import 'package:cresce_cuts/core/domain/errors/response_error.dart';
import 'package:either_dart/either.dart';

abstract class ProductsRepository {
  Future<Either<ResponseError, List<ProductEntity>>> call();
}
