part of com.curi.app.classflow.widgets;

class MonitorCardDetail extends StatelessWidget {
  const MonitorCardDetail({
    required this.name,
    super.key,
  });
  final String name;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white[0],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: UILayout.medium,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: UILayout.medium,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.ocean[40],
                      radius: UILayout.xlarge,
                      child: const CircleAvatar(
                        radius: UILayout.xlarge,
                        backgroundImage: NetworkImage(
                          'https://picsum.photos/id/237/200/300',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: UILayout.small,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.gray[90],
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.emoji_people_rounded,
                          color: Colors.gray[70],
                        ),
                        const SizedBox(
                          width: UILayout.xsmall,
                        ),
                        Text(
                          'Monitor',
                          style: TextStyle(
                            color: Colors.gray[90],
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: UILayout.medium,
                    ),
                    Text(
                      '17',
                      style: TextStyle(
                        color: Colors.gray[90],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Reseñas',
                      style: TextStyle(
                        color: Colors.gray[90],
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: UILayout.small,
                    ),
                    const Divider(
                      height: 2,
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: UILayout.small,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '4,95',
                          style: TextStyle(
                            color: Colors.gray[90],
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.sunset[50],
                        ),
                      ],
                    ),
                    Text(
                      'Rating',
                      style: TextStyle(
                        color: Colors.gray[90],
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: UILayout.small,
                    ),
                    const Divider(
                      height: 2,
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: UILayout.small,
                    ),
                    Text(
                      '2',
                      style: TextStyle(
                        color: Colors.gray[90],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Semestres como monitor',
                      style: TextStyle(
                        color: Colors.gray[90],
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: UILayout.medium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
