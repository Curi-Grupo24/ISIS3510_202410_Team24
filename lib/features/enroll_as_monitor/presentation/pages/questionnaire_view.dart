part of com.curi.app.enrollasmonitor.pages;

class CommonQuestionnaireView extends StatefulWidget {
  const CommonQuestionnaireView({Key? key}) : super(key: key);

  @override
  State<CommonQuestionnaireView> createState() =>
      _CommonQuestionnaireViewState();
}

class _CommonQuestionnaireViewState extends State<CommonQuestionnaireView> {
  CarouselController carouselController = CarouselController();
  int questionnaireIndex = 0;

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
          '''Por ultimo, si nos quisieras contar un poco más de ti y tu experiencia, lo puedes hacer acá :DD''',
      'answers': <String>[
        '',
      ],
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StepperChecks(
                steps: 4,
                currentStep:  questionnaireIndex + 1,
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
                      possibleAnswers: question['answers'],
                      onChanged: (String? answer) {
                        // viewModel
                        //   ..onAnswerChanged(answer, index)
                        //   ..changeTab(index + 1);
                      },
                      // answer: state.answers?[index],
                    ),
                  ),
                ],
                // items: questionCards,
              ),
            ],
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
                      // viewModel.evaluate();
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
}
