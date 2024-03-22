// ignore_for_file: cascade_invocations

part of com.curi.app.dashboard.pages;

class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  late List<DashboardTabData> tabs;
  String username = '';

  _getName() {
    UsersRepositoryImpl users = UsersRepositoryImpl();
    users
        .getUserName(AuthRepositoryImpl.uid)
        .then((String user) => username = user);
  }

  @override
  // ignore: must_call_super, always_declare_return_types, type_annotate_public_apis
  initState() {
    super.initState();
    //_getName();
    print(username);
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> sortedCards1 = <dynamic>[
      2,
      3,
      5,
    ];
    List<dynamic> sortedCards2 = <dynamic>[
      2,
      3,
    ];
    double aproxCardWidth = MediaQuery.of(context).size.width / 2.8;
    double textScaleFactor =
        math.max(MediaQuery.textScaleFactorOf(context), 1.1);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white[0],
        title: Text(
          'logo',
          style: TextStyle(
            fontSize: 16,
            color: Colors.gray[80],
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        leading: const SizedBox.shrink(),
        actions: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Get.toNamed('/notifications_home');
                },
                child: Icon(
                  Icons.notifications,
                  size: 24,
                  color: Colors.gray[70],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('profile_user');
                },
                child: CircleAvatar(
                  backgroundColor: Colors.ocean[40],
                  radius: UILayout.large,
                  child: const CircleAvatar(
                    radius: UILayout.xlarge,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/id/237/200/300',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: double.infinity,
            ),
            Text(
              username,
              style: TextStyle(
                fontSize: 16,
                color: Colors.gray[70],
              ),
            ),
            Spacing.spacingV12,
            const Padding(
              padding: EdgeInsets.all(16),
              child: CalendarHomeDashboard(),
            ),
            HorizontalCardScroll(
              title: 'Mis materias',
              onTapViewMore: () {
                Get.toNamed('/classes_list');
              },
              sortedCards: sortedCards1,
              aproxCardWidth: aproxCardWidth,
              textScaleFactor: textScaleFactor,
            ),
            Spacing.spacingV12,
            HorizontalCardScroll(
              title: 'En las  que soy monitor',
              onTapViewMore: () {
                Get.toNamed('/classes_list');
              },
              sortedCards: sortedCards2,
              aproxCardWidth: aproxCardWidth,
              textScaleFactor: textScaleFactor,
            ),
            Spacing.spacingV24,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.sunset[5],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Consejos',
                        style: TextStyle(
                          color: Colors.gray[90],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: double.infinity,
                      ),
                      Text(
                        'Revisa consejos para la universidad :D',
                        style: TextStyle(
                          color: Colors.gray[80],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Disponible proximamente',
                        style: TextStyle(
                          color: Colors.gray[70],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacing.spacingV24,
                    ],
                  ),
                ),
              ),
            ),
            Spacing.spacingV24,
            SunsetButton(
              text: 'Enroll',
              onPressed: () {
                Get.toNamed('/enroll_monitor_home');
              },
            ),
          ],
        ),
      ),
    );
  }
}
