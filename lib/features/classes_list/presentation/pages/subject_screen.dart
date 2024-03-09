part of com.curi.app.callseslist.pages;

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
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
            'Tus materias',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF111007),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AddSubjectCard(onPressed: () {}),
              const SearchInput(hintText: 'Name'),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Sort By',
                  style: TextStyle(
                    fontFamily: '', //TODO:
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 8,
                  top: 8,
                  bottom: 16,
                ),
                child: Row(
                  children: <Widget>[
                    SortButton(
                      text: 'Carrera',
                    ),
                    SortButton(
                      text: 'Tipo',
                    ),
                    SortButton(
                      text: 'Semestre',
                    ),
                  ],
                ),
              ),
              const Column(
                children: <Widget>[
                  SubjectCard(
                    subjectTitle: 'Probabilidad & Estadistica 1',
                    profesor: 'Profesora Laura Gonzales',
                    time: 'MXJ 12:30m',
                  ),
                  SubjectCard(
                    subjectTitle: 'Probabilidad & Estadistica 1',
                    profesor: 'Profesora Laura Gonzales',
                    time: 'MXJ 12:30m',
                  ),
                  SubjectCard(
                    subjectTitle: 'Probabilidad & Estadistica 1',
                    profesor: 'Profesora Laura Gonzales',
                    time: 'MXJ 12:30m',
                  ),
                  SubjectCard(
                    subjectTitle: 'Probabilidad & Estadistica 1',
                    profesor: 'Profesora Laura Gonzales',
                    time: 'MXJ 12:30m',
                  ),
                  SubjectCard(
                    subjectTitle: 'Probabilidad & Estadistica 1',
                    profesor: 'Profesora Laura Gonzales',
                    time: 'MXJ 12:30m',
                  ),
                ],
              ),
              const SizedBox(height: 56),
              
            ],
          ),
        ),
      );
}
