part of com.curi.app.administrator.pages;

class AvailableClassesList extends StatefulWidget {
  const AvailableClassesList({super.key});

  @override
  State<AvailableClassesList> createState() => _AvailableClassesListState();
}

class _AvailableClassesListState extends State<AvailableClassesList> {
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
            onPressed: () {
              Get.back(result: 'should rebuild');
            },
          ),
          title: const Text(
            'Clases ofertadas',
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
