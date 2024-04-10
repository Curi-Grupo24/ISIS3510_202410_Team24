part of com.curi.app.classeslist.pages;

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  String actualState = '';
  List<String> possibleCarreers = <String>[];
  List<String> possibleTypes = <String>[];
  List<String> possibleSemesters = <String>[];
  List<Map<String, dynamic>> classListFiltered = <Map<String, dynamic>>[];

  void updatePossibleCarreers() {
    List<String> updatedList = <String>[];
    for (Map<String, dynamic> element in classList) {
      if (!updatedList.contains(element['career'])) {
        updatedList.add(element['career']);
      }
    }
    setState(() {
      possibleCarreers = updatedList;
    });
  }

  void updatePossibleClassType() {
    List<String> updatedList = <String>[];
    for (Map<String, dynamic> element in classList) {
      if (element['type'] != null && !updatedList.contains(element['type'])) {
        updatedList.add(element['type']);
      }
    }
    setState(() {
      possibleTypes = updatedList;
    });
  }

  void updatePossibleSemester() {
    List<String> updatedList = <String>[];
    for (Map<String, dynamic> element in classList) {
      for (String classSemester in element['semester']) {
        if (!updatedList.contains(classSemester)) {
          updatedList.add(classSemester);
        }
      }
    }
    setState(() {
      possibleSemesters = updatedList;
    });
  }

  List<Map<String, dynamic>> classList = <Map<String, dynamic>>[
    <String, dynamic>{
      'className': 'Probabilidad & Estadistica 1',
      'career': 'Ingeniería industrial',
      'image': 'assets/images/image_asset1.png',
      'semester': <String>[
        'Segundo Semestre',
        'Tercer Semestre',
        'Cuarto Semestre',
      ],
    },
    <String, dynamic>{
      'className': 'Analisis de decisión e inversión',
      'career': 'Ingeniería industrial',
      'image': 'assets/images/image_asset2.png',
      'semester': <String>[
        'Segundo Semestre',
        'Tercer Semestre',
        'Cuarto Semestre',
      ],
    },
    <String, dynamic>{
      'className': 'Diseño y analisis de algoritmos',
      'career': 'Ingeniería de sistemas',
      'image': 'assets/images/image_asset4.png',
      'semester': <String>[
        'Cuarto Semestre',
      ],
    },
    <String, dynamic>{
      'className': 'El ciclo de Macondo',
      'career': 'Literatura',
      'image': 'assets/images/image_asset6.png',
      'type': 'Tipo E',
      'semester': <String>[
        'Cuarto Semestre',
      ],
    },
  ];

  String filterCarreer = '';
  String filterType = '';
  String filterSemester = '';

  void _updateCarreerFilter(String text) {
    setState(() {
      filterCarreer = text;
      classListFiltered = classListFiltered
          .where(
            (Map<String, dynamic> eachClass) => eachClass['career'] == text,
          )
          .toList();
    });
  }

  void _updateTypeFilter(String text) {
    setState(() {
      filterType = text;
      classListFiltered = classListFiltered
          .where(
            (Map<String, dynamic> eachClass) => eachClass['type'] == text,
          )
          .toList();
    });
  }

  void _updateSemesterFilter(String text) {
    setState(() {
      filterSemester = text;
      classListFiltered = classListFiltered
          .where(
            (Map<String, dynamic> eachClass) =>
                eachClass['semester'].contains(text),
          )
          .toList();
    });
  }

  String semestersNumbers(List<String> semesterNumbers) {
    StringBuffer responseBuffer = StringBuffer();
    for (String element in semesterNumbers) {
      responseBuffer.write('${semesterTypes[element]} ');
    }
    return responseBuffer.toString();
  }

  void updateFilterDef() {
    bool shouldResetFilter = filterCarreer == 'Carrera' &&
        filterType == 'Tipo' &&
        filterSemester == 'Semestre';
    bool careerAndType = filterCarreer != 'Carrera' &&
        filterType != 'Tipo' &&
        filterSemester == 'Semestre';
    bool careerAndSemester = filterCarreer != 'Carrera' &&
        filterType == 'Tipo' &&
        filterSemester != 'Semestre';
    bool career = filterCarreer != 'Carrera' &&
        filterType == 'Tipo' &&
        filterSemester == 'Semestre';
    bool typeAndSemester = filterCarreer == 'Carrera' &&
        filterType != 'Tipo' &&
        filterSemester != 'Semestre';
    bool type = filterCarreer == 'Carrera' &&
        filterType != 'Tipo' &&
        filterSemester == 'Semestre';
    bool semester = filterCarreer == 'Carrera' &&
        filterType == 'Tipo' &&
        filterSemester != 'Semestre';
    setState(() {
      setState(() {
        classListFiltered = classList;
      });
    });
    if (shouldResetFilter) {
      setState(() {
        setState(() {
          classListFiltered = classList;
        });
      });
    } else if (careerAndType) {
      _updateCarreerFilter(filterCarreer);
      _updateTypeFilter(filterType);
    } else if (careerAndSemester) {
      _updateCarreerFilter(filterCarreer);
      _updateSemesterFilter(filterSemester);
    } else if (career) {
      _updateCarreerFilter(filterCarreer);
    } else if (typeAndSemester) {
      _updateSemesterFilter(filterSemester);
      _updateTypeFilter(filterType);
    } else if (type) {
      _updateTypeFilter(filterType);
    } else if (semester) {
      _updateSemesterFilter(filterSemester);
    } else {
      _updateCarreerFilter(filterCarreer);
      _updateTypeFilter(filterType);
      _updateSemesterFilter(filterSemester);
    }
  }

  @override
  void initState() {
    filterCarreer = 'Carrera';
    filterType = 'Tipo';
    filterSemester = 'Semestre';
    classListFiltered = classList;
    updatePossibleCarreers();
    updatePossibleClassType();
    updatePossibleSemester();
    super.initState();
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
          title: const Text(
            'Tus materias',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: UILayout.medium,
              fontWeight: FontWeight.w800,
              color: Color(0xFF111007),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SunsetCardFollow(onPressed: () {}),
              const SearchInput(hintText: 'Name'),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Filtrar por',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.gray[90],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  top: 8,
                  bottom: 16,
                ),
                child: Row(
                  children: <Widget>[
                    SortButton(
                      text: filterCarreer,
                      onPressed: () {
                        showModalStatesToFilter(
                          possibleCarreers, 'select_carreer'.tr,
                          parentAction: (String value) {
                            setState(() {
                              filterCarreer = value;
                            });
                            updateFilterDef();
                          },
                          //  _updateCarreerFilter,
                        );
                      },
                      crossEnabled: filterCarreer != 'Carrera',
                      onCrossTapped: () {
                        setState(() {
                          filterCarreer = 'Carrera';
                          // classListFiltered = classList;
                        });
                        updateFilterDef();
                        // filterListToShow();
                      },
                    ),
                    SortButton(
                      text: filterType,
                      onPressed: () {
                        showModalStatesToFilter(
                          possibleTypes, 'Escoge el tipo de la materia'.tr,
                          parentAction: (String value) {
                            setState(() {
                              filterType = value;
                            });
                            updateFilterDef();
                          },
                          // _updateTypeFilter,
                        );
                      },
                      crossEnabled: filterType != 'Tipo',
                      onCrossTapped: () {
                        setState(() {
                          filterType = 'Tipo';
                          // classListFiltered = classList;
                        });
                        updateFilterDef();

                        // filterListToShow();
                      },
                    ),
                    SortButton(
                      text: filterSemester,
                      onPressed: () {
                        showModalStatesToFilter(
                          possibleSemesters, 'Escoge el semestre'.tr,
                          parentAction: (String value) {
                            setState(() {
                              filterSemester = value;
                            });
                            updateFilterDef();
                          },
                          // _updateSemesterFilter,
                        );
                      },
                      crossEnabled: filterSemester != 'Semestre',
                      onCrossTapped: () {
                        setState(() {
                          filterSemester = 'Semestre';
                          // classListFiltered = classList;
                        });
                        updateFilterDef();

                        // filterListToShow();
                      },
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  ...classListFiltered.map(
                    (Map<String, dynamic> eachClass) => SubjectCard(
                      subjectTitle: eachClass['className'],
                      profesor: eachClass['career'],
                      type: eachClass['type'],
                      image: eachClass['image'],
                      time:
                          '''${eachClass['semester'].length > 1 ? 'Semestre mixto: ' : ''}${eachClass['semester'].length > 1 ? semestersNumbers(
                              eachClass['semester'],
                            ) : eachClass['semester'][0]}''',
                      onTap: () {
                        Get.toNamed(
                          '/class_dashboard',
                          parameters: <String, String>{
                            'className': eachClass['className'],
                          },
                        );
                      },
                    ),
                  ),
                  if (classListFiltered.isEmpty)
                    const WarningMessage(
                      message: 'No hay clases para este filtro',
                    ),
                ],
              ),
              const SizedBox(height: 56),
            ],
          ),
        ),
      );

  Future<dynamic> showModalStatesToFilter(
    List<String> possibleFilters,
    String titleModal, {
    required ValueChanged<String> parentAction,
  }) =>
      showModalBottomSheet(
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
                    titleModal,
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
                    ...possibleFilters.map(
                      (String carreersState) => SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            parentAction(carreersState);
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
                                carreersState,
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
