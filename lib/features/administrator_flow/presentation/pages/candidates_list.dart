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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Esta es la lista de candidaturas activas',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: UILayout.medium,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF111007),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                FavTutorsCard(
                  name: 'suersname',
                  rate: '',
                  image:
                      'https://static.vecteezy.com/system/resources/thumbnails/036/280/651/small_2x/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg',
                  onTap: () {},
                  price: '',
                  
                ),
              ],
            ),
          ),
        ),
      );
}
