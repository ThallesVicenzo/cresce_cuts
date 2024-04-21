import 'package:cresce_cuts/core/enums/discount_types.dart';

class ProductEntity {
  final int id;
  final String title;
  final double initialPrice;
  final double finalPrice;
  final bool isActive;
  final String category;
  final String description;
  final String image;
  final DiscountType discount;
  final DateTime activationDate;
  final DateTime inactivationDate;

  ProductEntity({
    required this.id,
    required this.title,
    required this.initialPrice,
    required this.finalPrice,
    required this.isActive,
    required this.category,
    required this.description,
    required this.image,
    required this.discount,
    required this.activationDate,
    required this.inactivationDate,
  });
}
