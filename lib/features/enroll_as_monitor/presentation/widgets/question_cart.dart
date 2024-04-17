part of com.curi.app.enrollasmonitor.widgets;

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    required this.answersLength,
    required this.questionsLength,
    required this.currentStep,
    required this.question,
    required this.color,
    required this.possibleAnswers,
    required this.onChanged,
    this.indexAnswer = -1,

    // required this.answer,
    Key? key,
  }) : super(key: key);

  // final RiskProfileQuestion question;
  final String question;
  final int currentStep;
  final int questionsLength;
  final int answersLength;
  final Color? color;
  final List<String> possibleAnswers;
  final ValueChanged<Map<int, String>?> onChanged;
  final int? indexAnswer;
  // final RiskProfileQuestionAnswer? answer;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  late num selectedIndex = -1;
  @override
  void initState() {
    selectedIndex = -1;
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
                widget.question.tr,
                key: const Key('current_question_label'),
                style: Headings.h6.copyWith(color: Colors.white[0]),
                textAlign: TextAlign.center,
              ),
              Spacing.spacingV32,
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ...widget.possibleAnswers.map(
                        (String eachAnswer) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: GestureDetector(
                            onTap: () {
                              widget.onChanged(
                                <int, String>{
                                  widget.possibleAnswers.indexOf(eachAnswer):
                                      eachAnswer,
                                },
                              );
                              setState(() {
                                selectedIndex =
                                    widget.possibleAnswers.indexOf(eachAnswer);
                              });
                            },
                            child: AnswerTile(
                              answerText: eachAnswer,
                              colorTile: selectedIndex ==
                                          (widget.possibleAnswers
                                              .indexOf(eachAnswer)) ||
                                      widget.indexAnswer ==
                                          (widget.possibleAnswers
                                              .indexOf(eachAnswer))
                                  ? Colors.sunset[5]
                                  : Colors.white[0],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
