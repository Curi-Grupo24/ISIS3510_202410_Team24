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
  String className ='';
  @override
  void initState() {
    super.initState();
    className = Get.parameters['className']??'';
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
            style:const  TextStyle(
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
                FavTutorsCard(
                  name: 'Juan',
                  rate: '4,5',
                  image: 'https://picsum.photos/id/237/200/300',
                  onTap: (){
                    // showModalBottomSheet();
                  },
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
}
