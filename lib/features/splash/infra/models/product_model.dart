import 'package:cresce_cuts/core/map_extensions.dart';
import 'package:cresce_cuts/features/splash/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.category,
    required super.description,
    required super.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json.getValue('id'),
        title: json.getValue('title'),
        price: json.getValue('price'),
        category: json.getValue('category'),
        description: json.getValue('description'),
        image: json.getValue('image'),
      );
}
