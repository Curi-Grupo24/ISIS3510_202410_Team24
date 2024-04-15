part of com.curi.app.schedule.pages;

class ScheduleHome extends StatefulWidget {
  const ScheduleHome({super.key});

  @override
  State<ScheduleHome> createState() => _ScheduleHomeState();
}

class _ScheduleHomeState extends State<ScheduleHome> {
  bool isSelectedDate = false;
  int selectedIndex = 0;
  Map<String, String> selectedDate = <String, String>{
    'day': '''${diasSemana[DateTime.now().weekday]}''',
    'number': '${DateTime.now().day}',
  };
  List<int> daysOffTheWeek = <int>[
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
          title: const Text(
            'Calendario',
            style: TextStyle(
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
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        DateTime.now().hour < 12
                            ? 'Buenos Días!'
                            : DateTime.now().hour < 19
                                ? 'Buenas Tardes!'
                                : 'Buenas Noches!',
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF111007),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/schedule_register');
                        },
                        child: Icon(
                          Icons.add_circle,
                          color: Colors.sunset[40],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: UILayout.medium,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 60,
                      maxHeight: 100 *
                          math.max(
                            MediaQuery.textScaleFactorOf(context),
                            0.9,
                          ),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: daysOffTheWeek.length,
                      itemBuilder: (BuildContext context, int index) {
                        String day =
                            '''${diasSemana[((DateTime.now().weekday + index - 1) % 7 + 1)]}''';
                        DateTime now = DateTime.now();
                        int currentMonth = now.month;
                        int nextMonth = currentMonth + 1;
                        int nextYear =
                            currentMonth == 1 ? now.year + 1 : now.year;
                        int daysInnextMonth =
                            DateTime(nextYear, nextMonth + 1, 0).day;
                        String number =
                            '''${DateTime.now().day + index == 0 ? daysInnextMonth : DateTime.now().day + index}''';
                        bool isSelected = selectedIndex == index;
                        return Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? UILayout.medium : 0,
                            right: index == (daysOffTheWeek.length) - 1
                                ? UILayout.medium
                                : 0,
                            bottom: UILayout.small,
                          ),
                          child: DateCardButton(
                            number: number,
                            day: day,
                            onSelected: () {
                              setState(() {
                                if (selectedIndex == index) {
                                  selectedIndex = 0;
                                  selectedDate = <String, String>{
                                    'day':
                                        '''${diasSemana[DateTime.now().weekday]}''',
                                    'number': '${DateTime.now().day}',
                                  };
                                } else {
                                  selectedIndex = index;
                                  selectedDate = <String, String>{
                                    'day': day,
                                    'number': number,
                                  };
                                }
                                isSelectedDate = selectedIndex != -1;
                              });
                            },
                            isSelected: isSelected,
                          ),
                        );
                      },
                      separatorBuilder: (_, int index) => const SizedBox(
                        width: 8,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: UILayout.medium,
                  ),
                  Text(
                    '''Horario de ${selectedDate['number'] == '${DateTime.now().day}' ? 'hoy' : '${selectedDate['day']} ${selectedDate['number']}'}''',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF111007),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
