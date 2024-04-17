part of com.curi.app.enrollasmonitor.widgets;

class RiskProfileQuestionnaireContainer extends StatelessWidget {
  const RiskProfileQuestionnaireContainer(
      // this.data, {
      // required this.onChanged,
      // this.group,
      {
    Key? key,
  }) : super(key: key);
  // final RiskProfileQuestion data;
  // final RiskProfileQuestionAnswer? group;
  // final ValueChanged<RiskProfileQuestionAnswer?>? onChanged;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'data.question!',
            key: const Key('question_label'),
            style: Headings.mH2.copyWith(color: Colors.white[0]),
          ),
          Spacing.spacingV24,
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) =>
                RiskProfileQuestionnaireCard(
              key: Key('answer_${index}_button'),
              // group: group,
              // value: data.answers![index],
              // onChanged: {}(),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                Spacing.spacingV16,
            itemCount: 2,
          ),
        ],
      );
}

class RiskProfileQuestionnaireCard extends StatelessWidget {
  const RiskProfileQuestionnaireCard({
    // required this.value,
    // required this.group,
    // required this.onChanged,
    Key? key,
  }) : super(key: key);

  // final RiskProfileQuestionAnswer value;
  // final RiskProfileQuestionAnswer? group;
  // final void Function(RiskProfileQuestionAnswer?)? onChanged;

  // Color get _boderColor =>
  //     value == group ? Colors.meadown[20]! : Colors.gray[40]!;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.gray[40]!),

          // boxShadow: <BoxShadow>[shadowB4],
          color: Colors.white[0],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // onChanged!(value);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: UILayout.medium,
                vertical: UILayout.small,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const SizedBox(
                    width: UILayout.large,
                    // child:
                    // Radio<RiskProfileQuestionAnswer>(
                    //   // value: InvalidType,
                    //   activeColor: Colors.meadown[20],
                    //   hoverColor: Colors.meadown[20],
                    //   focusColor: Colors.meadown[20],
                    //   groupValue: group,
                    //   onChanged: onChanged,
                    // ),
                  ),
                  Spacing.spacingH16,
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        'value.response!',
                        key: const Key('answer_label'),
                        style: Paragraphs.medium.copyWith(
                          color: Colors.gray[80],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
