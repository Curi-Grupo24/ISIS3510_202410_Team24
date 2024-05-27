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
  String initialTime = '';
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController additionalNotesController = TextEditingController();
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
  String eventName = '';
  String dateDDMMYY = '';
  String description = '';
  String linkLocationOther = '';
  String additionalNotes = '';

  bool isErrorName = false;
  ScheduleRegisterBloc addEventBloc = ScheduleRegisterBloc();
  String isError = '';
  String isSuccess = '';
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
        body: BlocListener<ScheduleRegisterBloc, ScheduleRegisterState>(
          bloc: addEventBloc,
          listener: (BuildContext context, ScheduleRegisterState state) async {
            if (state is RegisterEventLoading) {
              await showDialog(
                barrierDismissible: true,
                context: context,
                builder: (BuildContext ctx) => SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: SpinKitRotatingCircle(
                    color: Colors.sunset[20],
                    size: 50,
                  ),
                ),
              );
            } else if (state is RegisterEventError) {
              Get.back();
              setState(() {
                isError = state.errorMessage;
              });
            } else if (state is RegisterEventSuccessfull) {
              Get.back();
              setState(() {
                isSuccess = state.successMessage;
              });
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: UILayout.medium,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (isError.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: WarningMessage(
                          isError: true,
                          message: isError,
                          padding: 0,
                        ),
                      ),
                    if (isSuccess.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: WarningMessage(
                          isError: false,
                          isSuccess: true,
                          message: isSuccess,
                          padding: 0,
                        ),
                      ),
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
                          int actualDay = (DateTime.now().day + index - 1) %
                                  DateTime(now.year, now.month + 1, 0).day +
                              1;

                          String number = actualDay.toString();
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
                                      builder: (
                                        BuildContext context,
                                        Widget? child,
                                      ) =>
                                          MediaQuery(
                                        data: MediaQuery.of(context).copyWith(
                                          alwaysUse24HourFormat: true,
                                        ),
                                        child: child!,
                                      ),
                                    );
                                    setState(() {
                                      initialTime = selectedTime
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
                                          initialTime.isEmpty
                                              ? 'Hora inicial'
                                              : initialTime,
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
                                      builder: (
                                        BuildContext context,
                                        Widget? child,
                                      ) =>
                                          MediaQuery(
                                        data: MediaQuery.of(context).copyWith(
                                          alwaysUse24HourFormat: true,
                                        ),
                                        child: child!,
                                      ),
                                    );

                                    setState(() {
                                      endTime = selectedTime
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
                                          endTime.isEmpty
                                              ? 'Hora final'.tr
                                              : endTime,
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
                      error: isErrorName ? 'Este campo es obligatorio' : null,
                      onChange: (String value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            eventName = value;
                          } else {
                            isErrorName = true;
                          }
                        });
                      },
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
                      controller: eventDescriptionController,
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
                        controller: locationController,
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
                      controller: additionalNotesController,
                      suffix: const Icon(Icons.edit),
                      hintText: 'Notas adicionales...',
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: UILayout.medium,
                    ),
                    SunsetButton(
                      text: 'Aceptar',
                      onPressed: isErrorName || eventName.isEmpty
                          ? null
                          : () {
                              addEventBloc.add(
                                RegisterEvent(
                                  eventToAdd: <String, dynamic>{
                                    'eventName': eventName,
                                    'initialDate':
                                        '2024-0${num.parse(selectedDate['number'] ?? '0') < DateTime.now().day ? DateTime.now().month + 1 : DateTime.now().month}-${selectedDate['number']} $initialTime:04',
                                    'endDate':
                                        '2024-0${num.parse(selectedDate['number'] ?? '0') < DateTime.now().day ? DateTime.now().month + 1 : DateTime.now().month}-${selectedDate['number']} $endTime:04',
                                    'description':
                                        eventDescriptionController.text,
                                    'location':
                                        actualLocation == 'Selecciona Ubicación'
                                            ? ''
                                            : actualLocation,
                                    'linkLocationOther':
                                        locationController.text,
                                    'additionalNotes':
                                        additionalNotesController.text,
                                  },
                                ),
                              );
                            },
                      backgroundColor: isErrorName || eventName.isEmpty
                          ? Colors.gray[50]
                          : Colors.sunset[60],
                    ),
                    const SizedBox(
                      height: UILayout.medium,
                    ),
                  ],
                ),
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
