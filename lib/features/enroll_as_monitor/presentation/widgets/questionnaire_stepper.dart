part of com.curi.app.enrollasmonitor.widgets;

class QuestionnaireStepper extends StatefulWidget {
  const QuestionnaireStepper({
    required this.length,
    required this.onChanged,
    this.initialIndex = 0,
    this.isValidStep = true,
    this.canGoBack = true,
    this.progressBackgroundColor,
    this.animationDuration = 400,
    this.progressColor,
    Key? key,
  }) : super(key: key);

  final int animationDuration;
  final int length;
  final bool isValidStep;
  final bool canGoBack;
  final int initialIndex;
  final Color? progressBackgroundColor;
  final Color? progressColor;
  final void Function(int value) onChanged;

  @override
  _QuestionnaireStepperState createState() => _QuestionnaireStepperState();
}

class _QuestionnaireStepperState extends State<QuestionnaireStepper> {
  int? index;

  @override
  void initState() {
    super.initState();
    index = widget.initialIndex;
  }

  double get progress => index! / widget.length;
  TextStyle get btnStyle => Paragraphs.disclaimer.copyWith(
        fontWeight: FontWeight.w500,
        height: 1,
      );

  Widget displayButton(
    void Function()? onPressed,
    String text,
    TextAlign direction,
    Color activatedColor, {
    Key? key,
  }) {
    List<Widget> children = <Widget>[
      Icon(
        direction == TextAlign.left
            ? Icons.arrow_back_ios_new
            : Icons.arrow_forward_ios,
        size: UILayout.medium,
      ),
      Text(text),
    ];
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(height: UILayout.xlarge),
      child: TextButton(
        key: key,
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.fromLTRB(
              UILayout.medium,
              UILayout.medium,
              UILayout.large,
              UILayout.medium,
            ),
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.disabled)
                    ? Colors.gray[40]!
                    : activatedColor,
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(btnStyle),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: direction == TextAlign.left
              ? children
              : children.reversed.toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white[0],
          border: Border(
            top: BorderSide(
              color: Colors.gray[40]!,
              width: 1,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom * 0.7,
            top: 1,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              displayButton(
                index! > 0 && widget.canGoBack
                    ? () {
                        index = math.max(index! - 1, 0);
                        widget.onChanged(index!);
                        setState(() {});
                      }
                    : null,
                'common.previous'.tr,
                TextAlign.left,
                Colors.gray[80]!,
                key: const Key('left_btn'),
              ),
              Expanded(
                child: LinearPercentIndicator(
                  animation: true,
                  lineHeight: 4,
                  animationDuration: widget.animationDuration,
                  percent: progress,
                  animateFromLastPercent: true,
                  backgroundColor:
                      widget.progressBackgroundColor ?? Colors.gray[30]!,
                  progressColor:
                      widget.progressColor ?? Colors.sunset[10]!,
                  barRadius: const Radius.circular(100),
                  padding: const EdgeInsets.all(0),
                ),
              ),
              displayButton(
                widget.isValidStep
                    ? () {
                        index = math.min(index! + 1, widget.length);
                        widget.onChanged(index!);
                        setState(() {});
                      }
                    : null,
                index! >= widget.length
                    ? 'common.finalize'.tr
                    : 'common.next'.tr,
                TextAlign.right,
                Colors.sunset[20]!,
                key: const Key('right_btn'),
              ),
            ],
          ),
        ),
      );
}
