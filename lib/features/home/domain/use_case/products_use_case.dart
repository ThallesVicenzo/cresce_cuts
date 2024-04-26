import 'package:cresce_cuts/core/domain/entities/product_entity.dart';
import 'package:cresce_cuts/core/domain/errors/response_error.dart';
import 'package:either_dart/either.dart';

import '../repository/products_repository.dart';

abstract class ProductsUseCase {
  Future<Either<ResponseError, List<ProductEntity>>> call();
}

class ProductsUsecaseImp implements ProductsUseCase {
  final ProductsRepository repository;

  ProductsUsecaseImp({required this.repository});

  @override
  Future<Either<ResponseError, List<ProductEntity>>> call() async {
    return await repository.call();
  }
}
