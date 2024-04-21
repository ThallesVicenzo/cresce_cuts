enum DiscountType {
  perPrice('Desconto por preço'),
  percentage('Percentual'),
  perNumber('Leve mais pague menos');

  const DiscountType(this.name);

  final String name;
}
