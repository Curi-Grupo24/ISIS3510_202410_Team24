// ignore_for_file: cascade_invocations

part of com.curi.app.dashboard.pages;

class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  late List<DashboardTabData> tabs;
  DashboardBloc dashboardBloc = DashboardBloc();
  MyClassesBloc myClassesBloc = MyClassesBloc();
  MyTutorClassesBloc myTutorsClassesBloc = MyTutorClassesBloc();
  List<ClassModel> myClassesList = <ClassModel>[];
  String username = '';

  @override
  void initState() {
    dashboardBloc.add(const GetUserInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double paddingBottom = MediaQuery.of(context).padding.bottom;
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(
          UILayout.medium,
          UILayout.medium,
          UILayout.medium,
          UILayout.medium + paddingBottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.home,
                      color: Colors.sunset[50],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/chats_home');
                    },
                    child: Icon(
                      Icons.chat_bubble_rounded,
                      color: Colors.gray[50],
                    ),
                  ),
                ),
              ],
            ),
            Spacing.spacingV8,
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<DashboardBloc, DashboardState>(
            bloc: dashboardBloc,
            builder: (BuildContext context, DashboardState state) {
              if (state is DashboardLoading) {
                return SpinKitRotatingCircle(
                  color: Colors.sunset[20],
                  size: 50,
                );
              } else if (state is DashboardSuccessfull) {
                myClassesBloc.add(const GetMyClasses());
                myTutorsClassesBloc.add(const GetMyTutorClasses());
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      width: double.infinity,
                    ),
                    Text(
                      'Hola, ${state.user.name}!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.gray[70],
                      ),
                    ),
                    Spacing.spacingV12,
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/schedule_home');
                        },
                        child: const CalendarHomeDashboard(),
                      ),
                    ),
                    if (state.user.myClasses.isEmpty)
                      SunsetCardFollow(
                        description:
                            '''Podrás empezar a buscar monitores en las clases que necesites''',
                        title: '''Añade las materias que estás viendo!''',
                        onPressed: () async {
                          String reloadView = '';
                          reloadView = await Get.toNamed('/add_class_view');
                          if (reloadView.isNotEmpty) {
                            setState(() {});
                          }
                        },
                      ),
                    if (state.user.myClasses.isNotEmpty)
                      BlocBuilder<MyClassesBloc, MyClassesState>(
                        bloc: myClassesBloc,
                        builder: (BuildContext context, MyClassesState state) {
                          if (state is GetMyClassesLoading) {
                            return const ShimmerDashboardClasses();
                          }
                          if (state is GetMyClassesError) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.gray[20],
                                  borderRadius: radius8,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Text(
                                        '''${state.errorMessage}, esperamos pronto poder mostrarte tus clases :D''',
                                        style:
                                            TextStyle(color: Colors.gray[80]),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Icon(
                                      Icons.face_3,
                                      color: Colors.gray[80],
                                    ),
                                    const SizedBox(
                                      width: double.infinity,
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          if (state is GetMyClassesSuccessfull) {
                            myClassesList = state.listClasses;
                            return HorizontalCardScroll(
                              title: 'Mis materias',
                              onTapViewMore: () async {
                                String reloadView = '';
                                reloadView = await Get.toNamed(
                                  '/classes_list',
                                  arguments: state.listClasses,
                                );
                                if (reloadView.isNotEmpty) {
                                  setState(() {});
                                }
                              },
                              sortedCards: state.listClasses,
                              aproxCardWidth: aproxCardWidth,
                              textScaleFactor: textScaleFactor,
                            );
                          } else {
                            return const ShimmerDashboardClasses();
                          }
                        },
                      ),
                    Spacing.spacingV12,
                    if (state.user.type != 'student')
                      BlocBuilder<MyTutorClassesBloc, MyTutorClassesState>(
                        bloc: myTutorsClassesBloc,
                        builder:
                            (BuildContext context, MyTutorClassesState state) {
                          if (state is GetMyTutorClassesLoading) {
                            return const ShimmerDashboardClasses();
                          }
                          if (state is GetMyTutorClassesError) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.gray[20],
                                  borderRadius: radius8,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Text(
                                        '''${state.errorMessage}, esperamos pronto poder mostrarte tus clases :D''',
                                        style:
                                            TextStyle(color: Colors.gray[80]),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Icon(
                                      Icons.face_3,
                                      color: Colors.gray[80],
                                    ),
                                    const SizedBox(
                                      width: double.infinity,
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          if (state is GetMyTutorClassesSuccessfull) {
                            return HorizontalCardScroll(
                              title: 'En las que soy monitor',
                              onTapViewMore: () {
                                // Get.toNamed('/choose_class_tutoring');
                              },
                              sortedCards: state.listClasses,
                              aproxCardWidth: aproxCardWidth,
                              textScaleFactor: textScaleFactor,
                              isFromTutoring: true,
                            );
                          } else {
                            return const ShimmerDashboardClasses();
                          }
                        },
                      ),
                    Spacing.spacingV12,
                    if (state.user.type == 'student')
                      SunsetCardFollow(
                        description:
                            '''Inscribete como monitor de la materias que te hayan gustado''',
                        title: 'Apuntate para monitor!',
                        onPressed: () async {
                          String shouldReload = '';
                          shouldReload =
                              await Get.toNamed('/choose_class_tutoring', arguments: myClassesList);
                          if (shouldReload.isNotEmpty) {
                            setState(() {});
                          }
                        },
                        backgroundColor: state.user.myClasses.isEmpty
                            ? Colors.ocean[5]
                            : const Color(0xFFFFEFBB),
                        buttonColor: state.user.myClasses.isEmpty
                            ? Colors.ocean[50]
                            : null,
                      ),
                    Spacing.spacingV24,
                    Spacing.spacingV24,
                  ],
                );
              } else {
                return SpinKitRotatingCircle(
                  color: Colors.sunset[20],
                  size: 50,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
