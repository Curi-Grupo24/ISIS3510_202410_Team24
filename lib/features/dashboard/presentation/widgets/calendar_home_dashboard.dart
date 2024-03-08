part of com.curi.app.dashboard.widgets;


class CalendarHomeDashboard extends StatelessWidget {
  const CalendarHomeDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) => DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.gray[20],
        borderRadius: radius16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Spacing.spacingH12,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacing.spacingV4,
                Text(
                  DateFormat('EEEE')
                      .format(DateTime.now())
                      .toLowerCase()
                      .tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.gray[80],
                  ),
                ),
                Text(
                  '7',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.gray[80],
                    fontSize: UILayout.large,
                  ),
                ),
                const EventCard(
                  title: 'Farmers Market',
                  time: '9:45-11:00AM',
                ),
                const EventCard(
                  title: 'Weekly Prep',
                  time: '11:15-1:00PM',
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacing.spacingV4,
                Text(
                  'tomorrow'.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.gray[80],
                  ),
                ),
                Spacing.spacingV8,
                const EventCard(title: 'Ravi\'s Birthday', time: ''),
                const EventCard(
                  title: 'Morning Swim',
                  time: '',
                ),
                const Text('5 more events'),
                Spacing.spacingV4,
                // EventCard(title: 'Home', time: '9:00-9:45AM'),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
}