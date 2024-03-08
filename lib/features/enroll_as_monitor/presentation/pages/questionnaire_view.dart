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

    },
    <String, dynamic>{

    },
    <String, dynamic>{

    },
  ];

  void swipeChangedTap(int index, _) {
    if (index > questionnaireIndex) {
      carouselController.animateToPage(1);
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    // RiskProfileQuestionnaireState state =
    //     ref.watch(riskProfileQuestionnaireController);
    // RiskProfileQuestionnaireViewModel viewModel =
    //     ref.read(riskProfileQuestionnaireController.notifier);
    bool isLocked = false;

    List<Widget> questionCards = <Widget>[
      QuestionCard(
        // question: currentQuestion!,
        currentStep: 0,
        questionsLength: 4,
        answersLength: 4,
        color: Colors.sunset[40],
        // onChanged: (RiskProfileQuestionAnswer? answer) {
        //   viewModel
        //     ..onAnswerChanged(answer, index)
        //     ..changeTab(index + 1);
        // },
        // answer: state.answers?[index],
      ),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        key: const Key('create_goal_wizard_view'),
        backgroundColor: Colors.jelly[40],
        appBar: AppBar(
          leading: isLocked ? const SizedBox.shrink() : null,
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
              currentStep: 1,
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
              items: questionCards,
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.fromLTRB(0, 0, UILayout.medium, UILayout.medium),
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
                    padding: EdgeInsets.all(16),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white[0],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
