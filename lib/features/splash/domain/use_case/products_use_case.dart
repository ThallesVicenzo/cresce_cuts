import 'package:cresce_cuts/core/domain/response_error.dart';
import 'package:cresce_cuts/features/splash/domain/entities/product_entity.dart';
import 'package:cresce_cuts/features/splash/domain/repository/products_repository.dart';
import 'package:either_dart/either.dart';

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
