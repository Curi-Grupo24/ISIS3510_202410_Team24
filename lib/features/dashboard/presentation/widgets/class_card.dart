part of com.curi.app.dashboard.widgets;

class OtherProductsCard extends StatelessWidget {
  const OtherProductsCard({
    this.productName = '',
    this.cardWidth = 150,
    this.message,
    this.badge,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String productName;
  final double cardWidth;
  final String? message;
  final ProductBadgeType? badge;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Opacity(
        opacity: onTap != null ? 1 : 0.5,
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: cardWidth,
            decoration: BoxDecoration(
              color: Colors.white[0],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: UILayout.medium,
                    top: UILayout.medium,
                    right: UILayout.large,
                    bottom: UILayout.medium,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        productName,
                        style: Headings.mH5.copyWith(color: Colors.gray[80]),
                        textAlign: TextAlign.left,
                      ),
                      const Expanded(child: SizedBox()),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8,),
                          child: Image.asset(
                            'assets/images/image_asset1.png',
                            width: 85,
                          ),
                        ),
                      ),
                      Spacing.spacingV8,
                    ],
                  ),
                ),
                if (badge != null) ProductBadge(badgeType: badge!),
              ],
            ),
          ),
        ),
      );
}
