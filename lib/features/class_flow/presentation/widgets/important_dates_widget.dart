part of com.curi.app.classflow.widgets;

class ImportantDatesWidget extends StatefulWidget {
  const ImportantDatesWidget({
    super.key,
  });

  @override
  State<ImportantDatesWidget> createState() => _ImportantDatesWidgetState();
}

class _ImportantDatesWidgetState extends State<ImportantDatesWidget> {
  bool isSelectedDate = false;
  int selectedIndex = -1;
  Map<String, dynamic> selectedDate = <String, dynamic>{};
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
  Widget build(BuildContext context) => Card(
        color: Colors.gray[20],
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Fechas importantes'.tr,
                      style: TextStyle(
                        color: Colors.gray[90],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (!isSelectedDate)
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/schedule_home');
                      },
                      child: Text(
                        'Ver todos'.tr,
                        style: TextStyle(
                          color: Colors.sunset[50],
                        ),
                      ),
                    ),
                  if (isSelectedDate)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelectedDate = false;
                          selectedIndex = -1;
                        });
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.gray[80],
                      ),
                    ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              if (!isSelectedDate)
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
                                selectedIndex = -1;
                                selectedDate = <String, dynamic>{};
                              } else {
                                selectedIndex = index;
                                selectedDate = <String, dynamic>{
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
              if (isSelectedDate)
                Row(
                  children: <Widget>[
                    DateCardButton(
                      number: selectedDate['day'],
                      day: selectedDate['number'],
                      onSelected: () {
                        setState(() {
                          selectedIndex = -1;
                          selectedDate = <String, dynamic>{};

                          isSelectedDate = selectedIndex != -1;
                        });
                      },
                      isSelected: isSelectedDate,
                    ),
                    const SizedBox(
                      width: UILayout.small,
                    ),
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
                          padding: const EdgeInsets.fromLTRB(
                            UILayout.medium,
                            UILayout.small,
                            5,
                            8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Parcial 2',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.gray[90],
                                ),
                              ),
                              Text(
                                '8:30 - 10:00',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.gray[70],
                                ),
                              ),
                              const SizedBox(
                                height: UILayout.small,
                              ),
                              Text(
                                'Tener en cuenta temas de la semana 8 a 13',
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
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      );
}
