part of com.curi.app.dashboard.widgets;


class ProductBadge extends StatelessWidget {
  const ProductBadge({required this.badgeType, Key? key}) : super(key: key);

  final ProductBadgeType badgeType;

  Color getBackgroundColor(ProductBadgeType badgeType) {
    switch (badgeType) {
      case ProductBadgeType.latest:
        return Colors.sunset[10]!;
      case ProductBadgeType.soon:
        return Colors.ocean[40]!;
      default:
        return Colors.sunset[1]!;
    }
  }

  Color getForegroundColor(ProductBadgeType badgeType) {
    switch (badgeType) {
      case ProductBadgeType.latest:
        return Colors.sunset[50]!;
      case ProductBadgeType.soon:
        return Colors.white[0]!;
      default:
        return Colors.sunset[50]!;
    }
  }

  @override
  Widget build(BuildContext context) => Positioned(
        right: -UILayout.mlarge - UILayout.small,
        top: UILayout.medium,
        child: Transform.rotate(
          angle: pi / 4,
          child: Container(
            width: UILayout.xxlarge + UILayout.mlarge,
            color: getBackgroundColor(badgeType),
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Nuevo',
              style: Headings.mH6.copyWith(
                color: getForegroundColor(badgeType),
              ),
              textAlign: TextAlign.center,
              textScaleFactor: 1,
            ),
          ),
        ),
      );
}
