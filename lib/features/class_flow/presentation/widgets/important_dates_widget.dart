part of com.curi.app.classflow.widgets;

class ImportantDatesWidget extends StatefulWidget {
  const ImportantDatesWidget({
    super.key,
  });

  @override
  State<ImportantDatesWidget> createState() => _ImportantDatesWidgetState();
}

class _ImportantDatesWidgetState extends State<ImportantDatesWidget> {
  bool isSelectedDate = false;
  @override
  Widget build(BuildContext context) => Card(
        color: Colors.gray[20],
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 4,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Fechas importantes'.tr,
                      style: TextStyle(
                        color: Colors.gray[90],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (!isSelectedDate)
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/schedule_home');
                      },
                      child: Text(
                        'Ver todos'.tr,
                        style: TextStyle(
                          color: Colors.sunset[50],
                        ),
                      ),
                    ),
                  if (isSelectedDate)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelectedDate = false;
                        });
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.gray[80],
                      ),
                    ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  DateCardButton(
                    number: '20',
                    day: 'Sat',
                    onSelected: () {
                      setState(() {
                        isSelectedDate = !isSelectedDate;
                      });
                    },
                    isSelected: isSelectedDate,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      );
}
