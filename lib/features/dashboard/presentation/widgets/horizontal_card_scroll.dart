part of com.curi.app.dashboard.widgets;

class HorizontalCardScroll extends StatelessWidget {
  const HorizontalCardScroll({
    required this.sortedCards,
    required this.aproxCardWidth,
    required this.textScaleFactor,
    required this.title,
    required this.onTapViewMore,
    this.isFromTutoring = false,
    super.key,
  });

  final List<ClassModel> sortedCards;
  final double aproxCardWidth;
  final double textScaleFactor;
  final String title;
  final void Function()? onTapViewMore;
  final bool isFromTutoring;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.gray[20],
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(UILayout.medium),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      title,
                      style: Headings.mH4.copyWith(
                        color: Colors.gray[90],
                      ),
                    ),
                  ),
                  Spacing.spacingV8,
                  if (sortedCards.isNotEmpty)
                    InkWell(
                      onTap: onTapViewMore,
                      child: Text(
                        'ver todos'.tr,
                        style: Headings.mH5.copyWith(
                          color: Colors.sunset[40],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 100,
                  maxHeight: 170 *
                      math.max(
                        MediaQuery.textScaleFactorOf(context),
                        1.1,
                      ),
                ),
                child: (sortedCards.isNotEmpty)
                    ? ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            sortedCards.length > 4 ? 4 : sortedCards.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? UILayout.medium : 0,
                            right: index == (sortedCards.length) - 1
                                ? UILayout.medium
                                : 0,
                            bottom: UILayout.medium,
                          ),
                          child: OtherProductsCard(
                            productName: sortedCards[index].className,
                            badge: ProductBadgeType.latest,
                            image: sortedCards[index].image,
                            message: '2024-1',
                            cardWidth: aproxCardWidth * textScaleFactor,
                            onTap: () {
                              !isFromTutoring
                                  ? Get.toNamed(
                                      '/class_dashboard',
                                      parameters: <String, String>{
                                        'className':
                                            sortedCards[index].className,
                                      },
                                      arguments: sortedCards[index],
                                    )
                                  : Get.toNamed('/waiting_confirmation');
                            },
                          ),
                        ),
                        separatorBuilder: (_, int index) => Spacing.spacingH8,
                      )
                    : SunsetCardFollow(
                        description:
                            '''Podrás empezar a buscar monitores en las clases que necesites''',
                        title: '''Añade las materias que estás viendo!''',
                        onPressed: () {
                          Get.toNamed('/add_class_view');
                        },
                        backgroundColor: Colors.transparent,
                      ),
              ),
            ),
          ],
        ),
      );
}
