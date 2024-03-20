part of com.curi.app.enrollasmonitor.widgets;

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    required this.answersLength,
    required this.questionsLength,
    required this.currentStep,
    // required this.question,
    required this.color,
    // required this.onChanged,
    // required this.answer,
    Key? key,
  }) : super(key: key);

  // final RiskProfileQuestion question;
  final int currentStep;
  final int questionsLength;
  final int answersLength;
  final Color? color;
  // final ValueChanged<RiskProfileQuestionAnswer?> onChanged;
  // final RiskProfileQuestionAnswer? answer;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  late num selectedIndex;
  @override
  void initState() {
    // int? indexAnswer = widget.question.answers?.indexWhere(
    //   (RiskProfileQuestionAnswer ans) => ans.score == widget.answer?.score,
    // );
    // selectedIndex = indexAnswer ?? -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: UILayout.small),
        decoration: BoxDecoration(
          color: Colors.jelly[10],
          borderRadius: BorderRadius.circular(UILayout.medium),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0x0f000000).withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '¿Cuál es tu experiencia en la materia que deseas monitorizar?'
                    .tr,
                key: const Key('current_question_label'),
                style: Headings.h6.copyWith(color: Colors.white[0]),
                textAlign: TextAlign.center,
              ),
              Spacing.spacingV32,
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          // widget.onChanged(widget.question.answers?[index]);
                          // selectedIndex = index;
                        },
                        child: AnswerTile(
                          answerText:
                              '''Tengo un conocimiento profundo y saqué excelentes calificaciones en cursos relacionados.''',
                          colorTile: Colors.white[0],
                        ),
                      ),
                      Spacing.spacingV12,
                      GestureDetector(
                        onTap: () {
                          // widget.onChanged(widget.question.answers?[index]);
                          // selectedIndex = index;
                        },
                        child: AnswerTile(
                          answerText:
                              '''Tengo un conocimiento básico de la materia y he aprobado los cursos relacionados.''',
                          colorTile: Colors.sunset[5],
                        ),
                      ),
                      Spacing.spacingV12,
                
                      GestureDetector(
                        onTap: () {
                          // widget.onChanged(widget.question.answers?[index]);
                          // selectedIndex = index;
                        },
                        child: AnswerTile(
                          answerText:
                              '''No tengo experiencia formal en la materia, pero estoy dispuesto a aprender y ayudar a los demás.''',
                          colorTile: Colors.white[0],
                        ),
                      ),
                      Spacing.spacingV12,
                      GestureDetector(
                        onTap: () {
                          // widget.onChanged(widget.question.answers?[index]);
                          // selectedIndex = index;
                        },
                        child: AnswerTile(
                          answerText:
                              'No he sido monitor, quisiera serlo.',
                          colorTile: Colors.white[0],
                        ),
                      ),

                    ],
                  ),
                ),

                // ListView.separated(
                //   shrinkWrap: true,
                //   physics: const ClampingScrollPhysics(),
                //   itemBuilder: (BuildContext context, int index) =>
                //       GestureDetector(
                //     onTap: () {
                //       // widget.onChanged(widget.question.answers?[index]);
                //       // selectedIndex = index;
                //     },
                //     child: AnswerTile(
                //       answerText:
                //           'widget.question.answers?[index].response ?? ',
                //       colorTile:
                //           index == selectedIndex ? Colors.sunset[5] : null,
                //     ),
                //   ),
                //   separatorBuilder: (BuildContext context, int index) =>
                //       Spacing.spacingV16,
                //   itemCount: widget.answersLength,
                // ),
              ),
              Spacing.spacingV32,
              Text(
                '${widget.currentStep + 1}/${widget.questionsLength}',
                style: Paragraphs.small.copyWith(color: Colors.white[0]),
              ),
              Spacing.spacingV8,
            ],
          ),
        ),
      );
}

class AnswerTile extends StatelessWidget {
  const AnswerTile({
    @required this.answerText,
    this.colorTile,
    Key? key,
  }) : super(key: key);

  final String? answerText;
  final Color? colorTile;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: colorTile ?? Colors.white[0],
          borderRadius: BorderRadius.circular(UILayout.small),
        ),
        child: Center(
          child: Text(
            answerText ?? '',
            textAlign: TextAlign.center,
            style: Paragraphs.small.copyWith(color: Colors.gray[80]),
            
          ),
        ),
      );
}
