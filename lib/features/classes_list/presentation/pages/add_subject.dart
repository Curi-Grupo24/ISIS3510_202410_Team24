part of com.curi.app.classeslist.pages;

class AddSubjectScreen extends StatefulWidget {
  const AddSubjectScreen({super.key});

  @override
  State<AddSubjectScreen> createState() => _AddSubjectScreenState();
}

class _AddSubjectScreenState extends State<AddSubjectScreen> {
  String actualState = '';
  List<String> possibleCarreers = <String>[];
  List<String> possibleTypes = <String>[];
  List<String> possibleSemesters = <String>[];
  List<ClassModel> classListFiltered = <ClassModel>[];
  String filterCarreer = '';
  String filterType = '';
  String filterSemester = '';
  TextEditingController? controller = TextEditingController();
  FetchSubjectBloc fetchClassBloc = FetchSubjectBloc();
  AddClassBloc addClassBloc = AddClassBloc();
  List<ClassModel> classList = <ClassModel>[];
  String responseToadd = '';
  String errorResponse = '';
  int count = 0;

  void updatePossibleCarreers() {
    List<String> updatedList = <String>[];
    for (ClassModel element in classList) {
      if (!updatedList.contains(element.career)) {
        updatedList.add(element.career);
      }
    }
    setState(() {
      possibleCarreers = updatedList;
    });
  }

  void updatePossibleClassType() {
    List<String> updatedList = <String>[];
    for (ClassModel element in classList) {
      if (element.type != null &&
          element.type!.isNotEmpty &&
          !updatedList.contains(element.type)) {
        updatedList.add(element.type!);
      }
    }
    setState(() {
      possibleTypes = updatedList;
    });
  }

  void updatePossibleSemester() {
    List<String> updatedList = <String>[];
    for (ClassModel element in classList) {
      for (String classSemester in element.semester) {
        if (!updatedList.contains(classSemester)) {
          updatedList.add(classSemester);
        }
      }
    }
    setState(() {
      possibleSemesters = updatedList;
    });
  }

  void _updateCarreerFilter(String text) {
    setState(() {
      filterCarreer = text;
      classListFiltered = classListFiltered
          .where(
            (ClassModel eachClass) => eachClass.career == text,
          )
          .toList();
    });
  }

  void _updateTypeFilter(String text) {
    setState(() {
      filterType = text;
      classListFiltered = classListFiltered
          .where(
            (ClassModel eachClass) => eachClass.type == text,
          )
          .toList();
    });
  }

  void _updateSemesterFilter(String text) {
    setState(() {
      filterSemester = text;
      classListFiltered = classListFiltered
          .where(
            (ClassModel eachClass) => eachClass.semester.contains(text),
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

  void searchForName(String value) {
    setState(() {
      if ((controller?.text.isNotEmpty ?? false) && value.isNotEmpty) {
        classListFiltered = classListFiltered
            .where(
              (ClassModel eachClass) =>
                  eachClass.className.toLowerCase().contains(
                        value.toLowerCase(),
                      ),
            )
            .toList();
      }
    });
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
      searchForName(controller?.text ?? '');
    });
    if (shouldResetFilter) {
      setState(() {
        setState(() {
          classListFiltered = classList;
        });
      });
      searchForName(controller?.text ?? '');
    } else if (careerAndType) {
      _updateCarreerFilter(filterCarreer);
      _updateTypeFilter(filterType);
      searchForName(controller?.text ?? '');
    } else if (careerAndSemester) {
      _updateCarreerFilter(filterCarreer);
      _updateSemesterFilter(filterSemester);
      searchForName(controller?.text ?? '');
    } else if (career) {
      _updateCarreerFilter(filterCarreer);
      searchForName(controller?.text ?? '');
    } else if (typeAndSemester) {
      _updateSemesterFilter(filterSemester);
      _updateTypeFilter(filterType);
      searchForName(controller?.text ?? '');
    } else if (type) {
      _updateTypeFilter(filterType);
      searchForName(controller?.text ?? '');
    } else if (semester) {
      _updateSemesterFilter(filterSemester);
      searchForName(controller?.text ?? '');
    } else {
      _updateCarreerFilter(filterCarreer);
      _updateTypeFilter(filterType);
      _updateSemesterFilter(filterSemester);
      searchForName(controller?.text ?? '');
    }
  }

  @override
  void initState() {
    filterCarreer = 'Carrera';
    filterType = 'Tipo';
    filterSemester = 'Semestre';
    fetchClassBloc.add(const FetchAllClases());
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
            'Añade materias',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: UILayout.medium,
              fontWeight: FontWeight.w800,
              color: Color(0xFF111007),
            ),
          ),
        ),
        body: BlocListener<FetchSubjectBloc, FetchSubjectState>(
          bloc: fetchClassBloc,
          listener: (BuildContext context, FetchSubjectState state) {
            if (state is FetchAllClasesSuccessful) {
              setState(() {
                classList = state.classesList;
                if (count < 1) {
                  classListFiltered = classList;
                  count++;
                }
              });
              updatePossibleCarreers();
              updatePossibleClassType();
              updatePossibleSemester();
            }
          },
          child: BlocBuilder<FetchSubjectBloc, FetchSubjectState>(
            bloc: fetchClassBloc,
            builder: (BuildContext context, FetchSubjectState state) {
              if (state is FetchClassError) {
                return Column(
                  children: <Widget>[
                    WarningMessage(
                      isError: true,
                      message: state.errorMessage,
                      padding: 0,
                    ),
                  ],
                );
              }
              if (state is FetchAllClasesSuccessful) {
                return BlocListener<AddClassBloc, AddClassState>(
                  bloc: addClassBloc,
                  listener: (BuildContext context, AddClassState state) async {
                    if (state is AddSubjectLoading) {
                      await showDialog(
                        context: context,
                        builder: (BuildContext ctx) => SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: SpinKitRotatingCircle(
                            color: Colors.sunset[20],
                            size: 50,
                          ),
                        ),
                      );
                    }
                    if (state is AddSubjectError) {
                      setState(() {
                      responseToadd ='';
                      errorResponse=state.errorMessage;
                      });
                      Get.back();
                    }
                    if (state is AddSubjectSuccessfull) {
                      setState(() {
                      responseToadd = state.successMessage;
                      errorResponse='';
                      });
                      Get.back();
                    }
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (responseToadd.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: WarningMessage(
                              isSuccess: true,
                              message: responseToadd,
                              padding: 0,
                            ),
                          ),
                        if (errorResponse.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: WarningMessage(
                              isError: true,
                              message: errorResponse,
                              padding: 0,
                            ),
                          ),
                        SearchInput(
                          hintText: 'Name',
                          controller: controller,
                          onChangedController: (String value) {
                            updateFilterDef();
                          },
                        ),
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
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                SortButton(
                                  text: filterCarreer,
                                  onPressed: () {
                                    showModalStatesToFilter(
                                      possibleCarreers,
                                      'select_carreer'.tr,
                                      parentAction: (String value) {
                                        setState(() {
                                          filterCarreer = value;
                                        });
                                        updateFilterDef();
                                      },
                                    );
                                  },
                                  crossEnabled: filterCarreer != 'Carrera',
                                  onCrossTapped: () {
                                    setState(() {
                                      filterCarreer = 'Carrera';
                                    });
                                    updateFilterDef();
                                  },
                                ),
                                SortButton(
                                  text: filterType,
                                  onPressed: () {
                                    showModalStatesToFilter(
                                      possibleTypes,
                                      'Escoge el tipo de la materia'.tr,
                                      parentAction: (String value) {
                                        setState(() {
                                          filterType = value;
                                        });
                                        updateFilterDef();
                                      },
                                    );
                                  },
                                  crossEnabled: filterType != 'Tipo',
                                  onCrossTapped: () {
                                    setState(() {
                                      filterType = 'Tipo';
                                    });
                                    updateFilterDef();
                                  },
                                ),
                                SortButton(
                                  text: filterSemester,
                                  onPressed: () {
                                    showModalStatesToFilter(
                                      possibleSemesters,
                                      'Escoge el semestre'.tr,
                                      parentAction: (String value) {
                                        setState(() {
                                          filterSemester = value;
                                        });
                                        updateFilterDef();
                                      },
                                    );
                                  },
                                  crossEnabled: filterSemester != 'Semestre',
                                  onCrossTapped: () {
                                    setState(() {
                                      filterSemester = 'Semestre';
                                    });
                                    updateFilterDef();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            ...classListFiltered.map(
                              (ClassModel eachClass) => SubjectCard(
                                subjectTitle: eachClass.className,
                                profesor: eachClass.career,
                                type: eachClass.type,
                                image: eachClass.image,
                                time:
                                    '''${eachClass.semester.length > 1 ? 'Semestre mixto: ' : ''}${eachClass.semester.length > 1 ? semestersNumbers(
                                        eachClass.semester,
                                      ) : eachClass.semester[0]}''',
                                onTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (BuildContext ctx) => SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: ModalCase(
                                        'Añadir materia',
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                          ),
                                          child: AddClassesModal(
                                            className: eachClass.className,
                                            onPressedAccept: () {
                                              addClassBloc.add(
                                                AddAClass(
                                                  classToAdd: eachClass,
                                                ),
                                              );
                                              Get.back();
                                            },
                                          ),
                                        ),
                                        height: 200,
                                      ),
                                    ),
                                  );
                                },
                                isForAdding: true,
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
              } else {
                return SpinKitRotatingCircle(
                  color: Colors.sunset[20],
                  size: 50,
                );
              }
            },
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
