part of com.curi.app.classflow.pages;

class ClassDashboard extends StatefulWidget {
  const ClassDashboard({super.key});

  @override
  State<ClassDashboard> createState() => _ClassDashboardState();
}

class _ClassDashboardState extends State<ClassDashboard> {
  String className = '';
  late ClassModel actualClass;
  List<Map<String, dynamic>> favTutorsList = <Map<String, dynamic>>[];
  ClassDashboardBloc classDashboardBloc = ClassDashboardBloc();
  String currencyFormat(String value) {
    try {
      NumberFormat oCcy = NumberFormat('#,##0.00', 'en_US');
      return oCcy.format(double.parse(value));
    } catch (_) {
      return value;
    }
  }

  @override
  void initState() {
    super.initState();
    className = Get.parameters['className'] ?? '';
    actualClass = Get.arguments;
    classDashboardBloc.add(
      GetDashboardClassInitial(
        availableTutors: actualClass.availableTutors,
      ),
    );
  }

  Future<void> _launchURL(BuildContext context) async {
    print("-------------------------------");
    print("mercado pago");
    try {
      await launch(
        'https://flutter.dev',
        customTabsOption: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: CustomTabsSystemAnimation.slideIn(),
          // or user defined animation.
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
        safariVCOption: SafariViewControllerOption(
          preferredBarTintColor: Theme.of(context).primaryColor,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }

  void pay() {
    print("-------------------------------");
    print("mercado pago");
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white[0],
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFF3962E),
            ),
            onPressed: Get.back,
          ),
          title: Text(
            className,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: UILayout.medium,
              fontWeight: FontWeight.w800,
              color: Color(0xFF111007),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: BlocBuilder<ClassDashboardBloc, ClassDashboardState>(
              bloc: classDashboardBloc,
              builder: (BuildContext context, ClassDashboardState state) {
                if (state is GetDashboardError) {
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: WarningMessage(
                          isError: true,
                          isSuccess: false,
                          message: state.errorMessage,
                          padding: 0,
                        ),
                      ),
                    ],
                  );
                }
                if (state is GetDashboardInfoSuccessful) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const ImportantDatesWidget(),
                      const SizedBox(
                        height: UILayout.small,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Tus monitores Favoritos'.tr,
                          style: TextStyle(
                            color: Colors.gray[90],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: UILayout.medium,
                      ),
                      if (state.tutorsList.isNotEmpty)
                        ...state.tutorsList.map(
                          (TutorModel tutor) => Padding(
                            padding: const EdgeInsets.only(
                              bottom: UILayout.medium,
                            ),
                            child: FavTutorsCard(
                              name: tutor.name,
                              rate: tutor.rate ?? '',
                              image: tutor.profilePicture ??
                                  'https://static.vecteezy.com/system/resources/thumbnails/036/280/651/small_2x/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg',
                              onTap: () {
                                tutorModalDetail(
                                  context,
                                  name: tutor.name,
                                  tutor: tutor,
                                );
                              },
                            ),
                          ),
                        ),
                      if (state.tutorsList.isEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: WarningMessage(
                            message:
                                'Parece que no tienes tutores favoritos aún'.tr,
                            padding: 0,
                          ),
                        ),
                      const SizedBox(
                        height: UILayout.medium,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                'Encuentra monitores'.tr,
                                style: TextStyle(
                                  color: Colors.gray[90],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                '/find_tutors',
                                parameters: <String, String>{
                                  'className': className,
                                  'type': 'none',
                                },
                                arguments: <String, dynamic>{
                                  'tutors': state.tutorsList,
                                },
                              );
                            },
                            child: Text(
                              'Ver todos'.tr,
                              style: TextStyle(
                                color: Colors.sunset[50],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: UILayout.medium,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  '/find_tutors',
                                  parameters: <String, String>{
                                    'className': className,
                                    'type': 'prices',
                                  },
                                  arguments: <String, dynamic>{
                                    'tutors': state.tutorsList,
                                  },
                                );
                              },
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.gray[10],
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.gray[30]!,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: UILayout.small,
                                      ),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Mejores precios'.tr,
                                          style: TextStyle(
                                            color: Colors.gray[80],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Image.asset(
                                        'assets/images/Image_circle.png',
                                        width: 101,
                                        height: 75,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: UILayout.medium,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  '/find_tutors',
                                  parameters: <String, String>{
                                    'className': className,
                                    'type': 'rating',
                                  },
                                  arguments: <String, dynamic>{
                                    'tutors': state.tutorsList,
                                  },
                                );
                              },
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.gray[10],
                                  border: Border.all(
                                    color: Colors.gray[30]!,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: UILayout.small,
                                      ),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Mejor Raiting'.tr,
                                          style: TextStyle(
                                            color: Colors.gray[80],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Image.asset(
                                        'assets/images/Image_circle2.png',
                                        width: 101,
                                        height: 72,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: UILayout.medium,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Tu progreso!'.tr,
                          style: TextStyle(
                            color: Colors.gray[90],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: UILayout.small,
                      ),
                      const ProgressCard(),
                      const SizedBox(
                        height: UILayout.large,
                      ),
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

  Future<dynamic> tutorModalDetail(
    BuildContext context, {
    required String name,
    required TutorModel tutor,
  }) =>
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(19),
          ),
        ),
        backgroundColor: const Color(0xFFF0ECE9),
        builder: (BuildContext context) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: UILayout.small,
                ),
                const SizedBox(
                  width: 48,
                  child: Divider(
                    height: 4,
                    thickness: 4,
                  ),
                ),
                const SizedBox(
                  height: UILayout.medium,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: UILayout.medium,
                  ),
                  child: MonitorCardDetail(
                    name: name,
                    tutor: tutor,
                  ),
                ),
                const SizedBox(
                  height: UILayout.medium,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Icon(
                          Icons.table_restaurant_rounded,
                          color: Colors.sunset[30],
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 72,
                        child: Text(
                          tutor.description ?? '',
                          style: TextStyle(
                            color: Colors.gray[80],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.access_alarm_outlined,
                        color: Colors.sunset[30],
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 72,
                        child: Text(
                          '\$ ${currencyFormat(tutor.price ?? '')} /h',
                          style: TextStyle(
                            color: Colors.gray[80],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: UILayout.medium,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: UILayout.medium,
                  ),
                  child: SunsetButton(
                    text: 'Iniciar chat'.tr,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => ChatPage(
                            receiverUserEmail: tutor.email ?? '',
                            receiverUserID: tutor.uid ?? '',
                            tutorModel: tutor,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: UILayout.medium,
                    vertical: UILayout.small,
                  ),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Agendar monitoría'.tr,
                        style: TextStyle(
                          color: Colors.sunset[70],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
