part of com.curi.app.dashboard.widgets;


class EventCard extends StatelessWidget {
  const EventCard({
    required this.title,
    required this.time,
    Key? key,
  }) : super(key: key);
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.sunset[30],
                borderRadius: radius4,
              ),
              child: const SizedBox(
                height: 48,
                child: VerticalDivider(
                  width: 3,
                ),
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.sunset[10]?.withOpacity(0.5),
                  borderRadius: radius8,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 5, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.gray[80],
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.gray[70],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
