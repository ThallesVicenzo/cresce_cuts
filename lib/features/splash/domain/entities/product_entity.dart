class ProductEntity {
  final int id;
  final String title;
  final dynamic price;
  final String category;
  final String description;
  final String image;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });
}
