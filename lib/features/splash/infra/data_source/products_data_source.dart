import '../../domain/entities/product_entity.dart';

abstract class ProductsDataSource {
  Future<List<ProductEntity>> call();
}
