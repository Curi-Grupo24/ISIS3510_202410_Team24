part of com.curi.app.schedule.pages;

class ScheduleRegister extends StatefulWidget {
  const ScheduleRegister({super.key});

  @override
  State<ScheduleRegister> createState() => _ScheduleRegisterState();
}

class _ScheduleRegisterState extends State<ScheduleRegister> {
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
            'Nuevo Evento',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: UILayout.medium,
              fontWeight: FontWeight.w800,
              color: Color(0xFF111007),
            ),
          ),
        ),
  );
}
