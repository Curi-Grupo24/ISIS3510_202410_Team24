part of com.curi.app.classflow.pages;

class FindTutorsView extends StatefulWidget {
  const FindTutorsView({super.key});

  @override
  State<FindTutorsView> createState() => _FindTutorsViewState();
}

class _FindTutorsViewState extends State<FindTutorsView> {
  String className = '';
  String type = '';
  TextEditingController? controller = TextEditingController();
  String filterRating = 'Calificación';
  String filterPrice = 'Precio';
  List<TutorModel> tutorsList = <TutorModel>[];

  List<int> listTutors = <int>[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
  ];

  List<Map<String, dynamic>> favTutorsList = <Map<String, dynamic>>[
    <String, dynamic>{
      'name': 'Juan',
      'rate': '4,5',
      'price': '15000 /h',
      'image': 'https://picsum.photos/id/237/200/300',
      'description': '',
      'tutoringClasses': <String>[
        'Probabilidad y Estadistica',
      ],
    },
    <String, dynamic>{
      'name': 'Alexa',
      'rate': '4,7',
      'price': '30.000 /h',
      'image': 'https://picsum.photos/id/237/200/300',
      'description': '',
      'tutoringClasses': <String>[
        'Probabilidad y Estadistica',
        'Calculo diferencial',
      ],
    }
  ];

  @override
  void initState() {
    super.initState();
    className = Get.parameters['className'] ?? '';
    type = Get.parameters['type'] ?? 'none';
    tutorsList = Get.arguments['tutors'];
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: UILayout.medium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: UILayout.small,
                  ),
                  Text(
                    'Monitores disponibles'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.gray[90],
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: UILayout.medium,
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: 90,
                      maxHeight: 90,
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: tutorsList.length,
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                        onTap: () {
                          tutorModalDetail(
                            context,
                            name: tutorsList[index].name,
                            tutor: tutorsList[index],
                          );
                        },
                        child: const SizedBox(
                          width: 80,
                          height: 90,
                          child:  CircleAvatar(
                            radius: 120,
                            backgroundImage: NetworkImage(
                              'https://picsum.photos/id/237/200/300',
                            ),
                          ),
                        ),
                      ),
                      separatorBuilder: (_, int index) => const SizedBox(
                        width: 8,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: UILayout.medium,
                  ),
                  SearchInput(
                    hintText: 'Name',
                    controller: controller,
                    onChangedController: (String value) {
                      // updateFilterDef();
                    },
                    paddingInput: const EdgeInsets.all(0),
                  ),
                  const SizedBox(
                    height: UILayout.medium,
                  ),
                  Text(
                    'Filtrar por',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.gray[90],
                    ),
                  ),
                  const SizedBox(
                    height: UILayout.small,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        SortButton(
                          text: 'Calificación',
                          onPressed: () {},
                          crossEnabled: filterRating != 'Calificación',
                          onCrossTapped: () {},
                        ),
                        const SizedBox(
                          width: UILayout.small,
                        ),
                        SortButton(
                          text: 'Precio',
                          onPressed: () {},
                          crossEnabled: filterPrice != 'Precio',
                          onCrossTapped: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: UILayout.medium,
                  ),
                  ...tutorsList.map(
                    (TutorModel tutor) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: UILayout.medium,
                      ),
                      child: FavTutorsCard(
                        name: tutor.name,
                        rate: tutor.rate??'',
                        image: 'https://picsum.photos/id/237/200/300',
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
                ],
              ),
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
                tutor: tutor ,
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
