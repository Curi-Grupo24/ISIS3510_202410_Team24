part of com.curi.app.administrator.pages;

class CandidatesList extends StatefulWidget {
  const CandidatesList({super.key});

  @override
  State<CandidatesList> createState() => _CandidatesListState();
}

class _CandidatesListState extends State<CandidatesList> {
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
          'Lista de candidaturas',
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
