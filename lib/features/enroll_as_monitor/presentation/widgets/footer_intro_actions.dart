part of com.curi.app.enrollasmonitor.widgets;

class FooterActionsIntroEnroll extends StatefulWidget {
  const FooterActionsIntroEnroll({
    Key? key,
  }) : super(key: key);

  @override
  State<FooterActionsIntroEnroll> createState() => _FooterActionsIntroEnroll();
}

class _FooterActionsIntroEnroll extends State<FooterActionsIntroEnroll> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/enroll_questionnaire');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.white[0]!,
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                const EdgeInsets.all(0),
              ),
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  width: double.infinity,
                ),
                Text(
                  'Empezar',
                  style: TextStyle(
                    color: Colors.gray[90],
                  ),
                ),
              ],
            ),
          ),

          Spacing.spacingV12,
          Spacing.spacingV12,
        ],
      );
}
