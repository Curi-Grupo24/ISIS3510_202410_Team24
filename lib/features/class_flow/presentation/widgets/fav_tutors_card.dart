part of com.curi.app.classflow.widgets;

class FavTutorsCard extends StatelessWidget {
  const FavTutorsCard({
    required this.name,
    required this.rate,
    required this.image,
    required this.onTap,
    this.price = '',
    this.descriptionCard,
    super.key,
  });

  final String name;
  final String rate;
  final String image;
  final String price;
  final void Function()? onTap;
  final String? descriptionCard;

  String currencyFormat(String value) {
    try {
      NumberFormat oCcy = NumberFormat('#,##0.00', 'en_US');
      return oCcy.format(double.parse(value));
    } catch (_) {
      return value;
    }
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white[0],
            border: Border.all(
              color: Colors.gray[40]!,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.ocean[40],
                  radius: UILayout.large,
                  child: CircleAvatar(
                    radius: UILayout.xlarge,
                    backgroundImage: NetworkImage(
                      image,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.gray[80],
                        ),
                      ),
                      if (descriptionCard != null)
                        Text(
                          descriptionCard!,
                          style: TextStyle(
                            color: Colors.gray[80],
                          ),
                        ),
                      Text(
                        'Ver más de $name'.tr,
                        style: TextStyle(color: Colors.ocean[40]),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          rate,
                          style: TextStyle(
                            color: Colors.gray[70],
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.sunset[50],
                        ),
                      ],
                    ),
                    if (price.isNotEmpty)
                      Text(
                        '\$ ${currencyFormat(price)} /h',
                        style: TextStyle(
                          color: Colors.gray[70],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
