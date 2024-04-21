import 'package:cresce_cuts/core/map_extensions.dart';
import 'package:cresce_cuts/features/splash/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.title,
    required super.initialPrice,
    required super.finalPrice,
    required super.isActive,
    required super.category,
    required super.description,
    required super.image,
    required super.discount,
    required super.activationDate,
    required super.inactivationDate,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json.getValue('id'),
        title: json.getValue('title'),
        initialPrice: json.getValue('initialPrice'),
        finalPrice: json.getValue('finalPrice'),
        isActive: json.getValue('isActive'),
        category: json.getValue('category'),
        description: json.getValue('description'),
        image: json.getValue('image'),
        discount: json.getValue('discount'),
        activationDate: DateTime.parse(json.getValue('activationDate')),
        inactivationDate: DateTime.parse(json.getValue('inactivationDate')),
      );
}
