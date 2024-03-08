class ProductBadgeType  {
  const ProductBadgeType._(String val);

  factory ProductBadgeType.fromString(String? value1) {
    switch (value1?.toUpperCase()) {
      case 'LATEST':
        return latest;
      case 'SOON':
        return soon;
      case 'SUGGESTED':
        return suggested;
      default:
        throw UnimplementedError();
    }
  }

  static const ProductBadgeType latest = ProductBadgeType._('Nuevo');
  static const ProductBadgeType soon = ProductBadgeType._('Pronto');
  static const ProductBadgeType suggested = ProductBadgeType._('Sugerido');
}
