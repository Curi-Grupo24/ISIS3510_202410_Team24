part of com.curi.app.classflow.pages;

class ClassDashboard extends StatefulWidget {
  const ClassDashboard({super.key});

  @override
  State<ClassDashboard> createState() => _ClassDashboardState();
}

class _ClassDashboardState extends State<ClassDashboard> {
  // bool isSelectedDate = false;
//   final AnimationController _controller = AnimationController(
//   duration: const Duration(milliseconds: 500), vsync: this,
// );
  String className = '';
  @override
  void initState() {
    super.initState();
    className = Get.parameters['className'] ?? '';
  }

  List<Map<String, dynamic>> favTutorsList = <Map<String, dynamic>>[
    <String, dynamic>{
      'name': 'Juan',
      'rate': '4,5',
      'image': 'https://picsum.photos/id/237/200/300',
    },
    <String, dynamic>{
      'name': 'Alexa',
      'rate': '4,7',
      'image': 'https://picsum.photos/id/237/200/300',
    }
  ];

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
            child: Column(
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
                ...favTutorsList.map(
                  (Map<String, dynamic> tutor) => Padding(
                    padding: const EdgeInsets.only(
                      bottom: UILayout.medium,
                    ),
                    child: FavTutorsCard(
                      name: tutor['name'],
                      rate: tutor['rate'],
                      image: tutor['image'],
                      onTap: () {
                        tutorModalDetail(
                          context,
                          name: tutor['name'],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: UILayout.medium,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Encuentra monitores'.tr,
                          style: TextStyle(
                            color: Colors.gray[90],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Ver todos'.tr,
                      style: TextStyle(
                        color: Colors.sunset[50],
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
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.gray[10],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.gray[30]!,
                          ),
                        ),
                        child: SizedBox(
                          height: 110,
                          // width: 140,
                          child: Column(children: <Widget>[
                            Text('data'),
                          ]),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: UILayout.medium,
                    ),
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.gray[10],
                          border: Border.all(
                            color: Colors.gray[30]!,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          height: 110,
                          // width: 140,
                          child: Column(children: [
                            Text('data'),
                          ]),
                        ),
                      ),
                    ),
                  ],
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
              ],
            ),
          ),
        ),
      );

  Future<dynamic> tutorModalDetail(
    BuildContext context, {
    required String name,
  }) =>
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(19),
          ),
        ),
        backgroundColor: const Color(0xFFF0ECE9),
        builder: (BuildContext context) => Column(
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
              ),
            ),
            const SizedBox(
              height: UILayout.medium,
            ),
            Text('Info adicional'),
            const SizedBox(
              height: UILayout.medium,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: UILayout.medium,
              ),
              child: SunsetButton(
                text: 'Iniciar chat'.tr,
              ),
            ),
          ],
        ),
      );
}
