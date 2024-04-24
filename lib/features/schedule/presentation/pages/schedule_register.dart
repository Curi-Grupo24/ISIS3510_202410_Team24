part of com.curi.app.schedule.pages;

class ScheduleRegister extends StatefulWidget {
  const ScheduleRegister({super.key});

  @override
  State<ScheduleRegister> createState() => _ScheduleRegisterState();
}

class _ScheduleRegisterState extends State<ScheduleRegister> {
  bool isSelectedDate = false;
  int selectedIndex = 0;
  String endTime = '';
  String initilTime = '';
  TextEditingController eventNameController = TextEditingController();
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
  String actualLocation = 'Selecciona Ubicación';

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
            'Nuevo Evento',
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
                horizontal: UILayout.medium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '''Horario para ${selectedDate['number'] == '${DateTime.now().day}' ? 'hoy' : '${selectedDate['day']} ${selectedDate['number']}'}''',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF111007),
                    ),
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
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Inicio'.tr,
                              style: TextStyle(
                                color: Colors.gray[90],
                                fontSize: 18,
                              ),
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () async {
                                  TimeOfDay? selectedTime =
                                      await showTimePicker(
                                    initialTime: TimeOfDay.now(),
                                    initialEntryMode:
                                        TimePickerEntryMode.inputOnly,
                                    context: context,
                                  );
                                  setState(() {
                                    initilTime = selectedTime
                                        .toString()
                                        .replaceAll(
                                          'TimeOfDay(',
                                          '',
                                        )
                                        .replaceAll(
                                          ')',
                                          '',
                                        );
                                  });
                                },
                                child: Card(
                                  elevation: 0,
                                  color: Colors.gray[20],
                                  child: Column(
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        initilTime.isEmpty
                                            ? 'Hora inicial'
                                            : initilTime,
                                        style: TextStyle(
                                          color: Colors.gray[90],
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                        width: double.infinity,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Final'.tr,
                              style: TextStyle(
                                color: Colors.gray[90],
                                fontSize: 18,
                              ),
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () async {
                                  TimeOfDay? selectedTime =
                                      await showTimePicker(
                                    initialTime: TimeOfDay.now(),
                                    initialEntryMode:
                                        TimePickerEntryMode.inputOnly,
                                    context: context,
                                  );
                                  setState(() {
                                    endTime = selectedDate.toString();
                                  });
                                },
                                child: Card(
                                  elevation: 0,
                                  color: Colors.gray[20],
                                  child: Column(
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'hora'.tr,
                                        style: TextStyle(
                                          color: Colors.gray[90],
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                        width: double.infinity,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: UILayout.medium,
                  ),
                  Text(
                    'Nombre del evento'.tr,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF111007),
                    ),
                  ),
                  Input(
                    controller: eventNameController,
                    suffix: const Icon(Icons.edit),
                    hintText: 'Nombre del evento',
                  ),
                  const SizedBox(
                    height: UILayout.medium,
                  ),
                  Text(
                    'Descripción'.tr,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF111007),
                    ),
                  ),
                  Input(
                    controller: eventNameController,
                    suffix: const Icon(Icons.edit),
                    hintText: 'Descripción del devento',
                  ),
                  const SizedBox(
                    height: UILayout.medium,
                  ),
                  Text(
                    'Escoge Ubicación'.tr,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF111007),
                    ),
                  ),
                  DropDownButtonLocation(
                    actualState: actualLocation,
                    isDefaultState: actualLocation != 'Selecciona Ubicación',
                    onPressed: showModalStates,
                    onPressedCrossIcon: () {
                      setState(() {
                        actualLocation = 'Selecciona Ubicación';
                      });
                      // validateForm();
                    },
                  ),
                  const SizedBox(
                    height: UILayout.medium,
                  ),
                  if (actualLocation != 'Selecciona Ubicación')
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Link/ubicación/otro'.tr,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF111007),
                          ),
                        ),
                        TooltipOcean(
                          text:
                              '''Puedes poner el lugar donde se llevará a cabo el evento, si deseas puedes poner el link para entrar más fácil'''
                                  .tr,
                        ),
                      ],
                    ),
                  if (actualLocation != 'Selecciona Ubicación')
                    const SizedBox(
                      height: UILayout.medium,
                    ),
                  if (actualLocation != 'Selecciona Ubicación')
                    Input(
                      controller: eventNameController,
                      suffix: const Icon(Icons.edit),
                      hintText: 'Ubicación',
                    ),
                  Text(
                    'Notas adicionales'.tr,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF111007),
                    ),
                  ),
                  Input(
                    controller: eventNameController,
                    suffix: const Icon(Icons.edit),
                    hintText: 'Notas adicionales...',
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: UILayout.medium,
                  ),
                  SunsetButton(
                    text: 'Aceptar',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: UILayout.medium,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Future<dynamic> showModalStates() {
    List<String> possibleLocations = <String>[
      'Universidad'.tr,
      'Meet'.tr,
      'Zoom'.tr,
      'Discord'.tr,
      'Otro'.tr,
    ];
    return showModalBottomSheet(
      backgroundColor: Colors.white[0],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(19),
        ),
      ),
      context: context,
      builder: (BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Text(
                  'Escoge la ubicación'.tr,
                  style: TextStyle(
                    color: Colors.gray[90],
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Center(
                child: IconButton(
                  iconSize: 18,
                  onPressed: Get.back,
                  icon: Icon(
                    Icons.close,
                    color: Colors.gray[90],
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 1),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ...possibleLocations.map(
                    (String locationState) => SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            actualLocation = locationState;
                          });
                          //validate Form();
                          Get.back();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(
                                MaterialState.pressed,
                              )) {
                                return Colors.sunset[50]!;
                              } else {
                                return Colors.white[0]!;
                              }
                            },
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                            ),
                            child: Text(
                              locationState,
                              style: TextStyle(
                                color: Colors.gray[90],
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
