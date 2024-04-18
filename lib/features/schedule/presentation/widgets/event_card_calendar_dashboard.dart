part of com.curi.app.schedule.widgets;

class EventCardCalendarDashboard extends StatelessWidget {
  const EventCardCalendarDashboard({
    required this.titleEvent,
    required this.eventGuest,
    required this.eventLocation,
    required this.eventHours,
    super.key,
  });
  final String titleEvent;
  final String eventGuest;
  final String eventLocation;
  final String eventHours;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          //Go to event detail
        },
        child: Card(
          elevation: 0,
          color: Colors.ocean[5],
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      titleEvent,
                      style: TextStyle(
                        color: Colors.gray[80],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                      // width: double.infinity,
                    ),
                    Text(
                      eventGuest,
                      style: TextStyle(
                        color: Colors.gray[80],
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      eventLocation,
                      style: TextStyle(
                        color: Colors.gray[80],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    eventHours,
                    style: TextStyle(
                      color: Colors.gray[80],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
}
