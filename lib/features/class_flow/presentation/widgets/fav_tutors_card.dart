part of com.curi.app.classflow.widgets;

class FavTutorsCard extends StatelessWidget {
  const FavTutorsCard({
    required this.name,
    required this.rate,
    required this.image,
    required this.onTap,
    super.key,
  });

  final String name;
  final String rate;
  final String image;
  final void Function()? onTap;

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
                      // 'https://picsum.photos/id/237/200/300',
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
                      Text(
                        'Ver más de $name'.tr,
                        style: TextStyle(color: Colors.ocean[40]),
                      ),
                    ],
                  ),
                ),
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
              ],
            ),
          ),
        ),
      );
}
