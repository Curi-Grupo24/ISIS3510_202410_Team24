part of com.curi.app.enrollasmonitor.pages;

class CommonQuestionnaireView extends StatefulWidget {
  const CommonQuestionnaireView({Key? key}) : super(key: key);

  @override
  State<CommonQuestionnaireView> createState() =>
      _CommonQuestionnaireViewState();
}

class _CommonQuestionnaireViewState extends State<CommonQuestionnaireView> {
  CarouselController carouselController = CarouselController();
  TextEditingController controllerLastQuestion = TextEditingController();
  EnrollTutorBloc enrollClassTutorBloc = EnrollTutorBloc();
  String errorMessage = '';
  String errorResponseBloc = '';

  int questionnaireIndex = 0;
  late ClassModel classToApplyFor;

  List<Map<String, dynamic>> questions = <Map<String, dynamic>>[
    <String, dynamic>{
      'question': '¿Cuál es tu experiencia en esta materia?',
      'answers': <String>[
        '''Tengo un conocimiento profundo y saqué excelentes calificaciones en cursos relacionados.''',
        '''Tengo un conocimiento básico de la materia y he aprobado los cursos relacionados.''',
        '''No tengo experiencia formal en la materia, pero estoy dispuesto a aprender y ayudar a los demás.''',
        '''No he sido monitor, quisiera serlo.''',
      ],
    },
    <String, dynamic>{
      'question':
          '''¿Qué habilidades y cualidades crees que te hacen un buen candidato para ser monitor?''',
      'answers': <String>[
        '''Soy paciente, organizado y tengo buenas habilidades de comunicación.''',
        '''Soy creativo, motivado y tengo capacidad para trabajar en equipo.''',
        '''Soy responsable, puntual y tengo disponibilidad para ayudar a los demás.''',
      ],
    },
    <String, dynamic>{
      'question': '¿Qué expectativas tienes como monitor?',
      'answers': <String>[
        '''Espero poder compartir mi conocimiento con otros y ayudarlos a alcanzar su máximo potencial.''',
        '''Espero aprender de la experiencia y mejorar mis habilidades como docente.''',
        '''Espero contribuir a la comunidad educativa y crear un impacto positivo en la vida de los estudiantes.''',
        '''Quisiera tener un ingreso extra''',
      ],
    },
    <String, dynamic>{
      'question':
          '''Por último, si nos quisieras contar un poco más de ti y tu experiencia, lo puedes hacer acá :DD''',
      'answers': <String>[],
    },
  ];

  void swipeChangedTap(int index, _) {
    setState(() {
      questionnaireIndex = index;
    });
    if (index > questionnaireIndex) {
      carouselController.animateToPage(1);
    }
  }

  @override
  void initState() {
    classToApplyFor = Get.arguments;
    super.initState();
  }

  int indexSelected = 0;
  List<Map<int, String>> listAnswers = <Map<int, String>>[
    <int, String>{-1: ''},
    <int, String>{-1: ''},
    <int, String>{-1: ''},
    <int, String>{-1: ''},
  ];
  List<Map<int, Map<int, String>>> listAnswersUpdated =
      <Map<int, Map<int, String>>>[];

  @override
  Widget build(
    BuildContext context,
  ) =>
      AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          key: const Key('create_goal_wizard_view'),
          backgroundColor: Colors.jelly[40],
          appBar: AppBar(
            backgroundColor: Colors.jelly[40],
            centerTitle: true,
            elevation: 0,
            title: Text(
              'Queremos conocerte'.tr,
            ),
            titleTextStyle: Headings.mH5.copyWith(
              color: Colors.white[0],
            ),
          ),
          body: SingleChildScrollView(
            child: BlocListener<EnrollTutorBloc, EnrollTutorState>(
              bloc: enrollClassTutorBloc,
              listener: (BuildContext context, EnrollTutorState state) async {
                if (state is EnrollTutorError) {
                  Get.back();
                  setState(() {
                    errorResponseBloc = state.errorMessage;
                  });
                } else if (state is EnrollTutorLoading) {
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
                if (state is EnrollTutorSuccessfull) {
                  errorResponseBloc = '';
                  Get.back();
                  await Get.offAllNamed(
                    '/result_enrollment_page',
                    arguments: classToApplyFor,
                  );
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: WarningMessage(
                        isError: true,
                        message: errorMessage,
                        padding: 0,
                      ),
                    ),
                  if (errorResponseBloc.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: WarningMessage(
                        isError: true,
                        message: errorResponseBloc,
                        padding: 0,
                      ),
                    ),
                  StepperChecks(
                    steps: 4,
                    currentStep: questionnaireIndex + 1,
                    activeColor: Colors.sunset[10]!,
                    inactiveColor: Colors.sunset[20]!,
                  ),
                  Spacing.spacingV32,
                  CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.63,
                      viewportFraction: 0.82,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: swipeChangedTap,
                    ),
                    items: <Widget>[
                      ...questions.map(
                        (Map<String, dynamic> question) => QuestionCard(
                          question: question['question'],
                          currentStep: questionnaireIndex,
                          questionsLength: 4,
                          answersLength: 5,
                          color: Colors.sunset[40],
                          controllerLastQuestion: controllerLastQuestion,
                          indexAnswer: listAnswers[questions.indexOf(question)]
                              .keys
                              .first,
                          possibleAnswers: question['answers'],
                          onChanged: (Map<int, String>? answer) {
                            setState(() {
                              listAnswers.replaceRange(
                                questions.indexOf(question),
                                questions.indexOf(
                                  question,
                                ),
                                <Map<int, String>>[
                                  answer!,
                                ],
                              );
                              agregarRespuestaSinDuplicados(
                                questions.indexOf(question),
                                answer,
                              );
                            });
                            carouselController
                                .animateToPage(questionnaireIndex + 1);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(
              0,
              0,
              UILayout.medium,
              UILayout.medium,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Visibility(
                  visible: questionnaireIndex == questions.length - 1,
                  replacement: Spacing.spacingV48,
                  child: GestureDetector(
                    onTap: () {
                      listAnswersUpdated.length == 3 &&
                              controllerLastQuestion.text.trim().isNotEmpty
                          ? enrollClassTutorBloc.add(
                              EnroolToAClass(
                                answersList: listAnswersUpdated,
                                classToAdd: classToApplyFor,
                                lastAnswer: controllerLastQuestion.text,
                              ),
                            )
                          : setState(() {
                              errorMessage =
                                  '''Asegurate de llenar toda la información''';
                            });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.sunset[20],
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white[0],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  void agregarRespuestaSinDuplicados(
    int preguntaIndice,
    Map<int, String> respuesta,
  ) {
    bool claveExiste = listAnswersUpdated.any(
      (
        Map<int, Map<int, String>> mapaExistente,
      ) =>
          mapaExistente.containsKey(preguntaIndice),
    );
    if (claveExiste) {
      setState(() {
        int indiceRespuestaExistente = listAnswersUpdated.indexWhere(
          (Map<int, Map<int, String>> mapaExistente) =>
              mapaExistente.containsKey(preguntaIndice),
        );

        listAnswersUpdated[indiceRespuestaExistente] = <int, Map<int, String>>{
          preguntaIndice: respuesta,
        };
      });
    } else {
      setState(() {
        listAnswersUpdated.add(
          <int, Map<int, String>>{preguntaIndice: respuesta},
        );
      });
    }
  }
}
