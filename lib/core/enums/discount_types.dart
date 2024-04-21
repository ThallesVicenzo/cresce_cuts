enum DiscountType {
  perPrice('Por preço'),
  percentage('Percentual'),
  perNumber('Quantidade');

  const DiscountType(this.name);

  final String name;
}
