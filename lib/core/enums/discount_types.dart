enum DiscountType {
  perPrice('Por preço'),
  percentage('Percentual'),
  perQuantity('Quantidade');

  const DiscountType(this.name);
  final String name;

  static DiscountType fromString(String? value) {
    switch (value?.toUpperCase().trim()) {
      case 'POR PREÇO':
        return DiscountType.perPrice;
      case 'PERCENTUAL':
        return DiscountType.percentage;
      case 'QUANTIDADE':
        return DiscountType.perQuantity;
      default:
        return DiscountType.perPrice;
    }
  }
}
