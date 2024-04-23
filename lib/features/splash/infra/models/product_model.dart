import 'package:cresce_cuts/core/domain/entities/product_entity.dart';
import 'package:cresce_cuts/core/enums/discount_types.dart';
import 'package:cresce_cuts/core/map_extensions.dart';

class ProductModel extends ProductEntity {
  ProductModel({
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
        title: json.getValue('title'),
        initialPrice: json.getValue('initialPrice'),
        finalPrice: json.getValue('finalPrice'),
        isActive: json.getValue('isActive'),
        category: json.getValue('category'),
        description: json.getValue('description'),
        image: json.getValue('image'),
        discount: DiscountType.fromString(json.getValue('discount')),
        activationDate: DateTime.parse(json.getValue('activationDate')),
        inactivationDate: DateTime.parse(json.getValue('inactivationDate')),
      );
}
