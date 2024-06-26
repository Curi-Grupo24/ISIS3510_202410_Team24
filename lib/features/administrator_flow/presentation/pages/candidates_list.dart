part of com.curi.app.administrator.pages;

class CandidatesList extends StatefulWidget {
  const CandidatesList({super.key});

  @override
  State<CandidatesList> createState() => _CandidatesListState();
}

class _CandidatesListState extends State<CandidatesList> {
  AvailableCandidatesBloc candidatesBloc = AvailableCandidatesBloc();
  String errorMessage = '';
  String successMessage = '';
  @override
  void initState() {
    candidatesBloc.add(const GetCandidates());
    super.initState();
  }

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
            child:
                BlocBuilder<AvailableCandidatesBloc, AvailableCandidatesState>(
              bloc: candidatesBloc,
              builder: (BuildContext context, AvailableCandidatesState state) {
                if (state is AvailableCandidatesSuccessfull) {
                  return Column(
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
                      ...state.candidatesTotal.map(
                        (Map<String, dynamic> eachCandidate) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: FavTutorsCard(
                            name: eachCandidate['userName'],
                            descriptionCard: eachCandidate['classname'],
                            rate: '',
                            image: eachCandidate['profilePicture'] ??
                                'https://static.vecteezy.com/system/resources/thumbnails/036/280/651/small_2x/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg',
                            onTap: () {
                              candidateModalDetail(
                                context,
                                candidate: eachCandidate,
                                name: eachCandidate['userName'],
                              );
                            },
                            price: '',
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is AvailableCandidatesError) {
                  return Column(
                    children: <Widget>[
                      WarningMessage(
                        isError: true,
                        message: state.errorMessage,
                        padding: 0,
                      ),
                    ],
                  );
                } else {
                  return SpinKitRotatingCircle(
                    color: Colors.sunset[20],
                    size: 50,
                  );
                }
              },
            ),
          ),
        ),
      );

  Future<dynamic> candidateModalDetail(
    BuildContext context, {
    required String name,
    required Map<String, dynamic> candidate,
  }) =>
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(19),
          ),
        ),
        isScrollControlled: true,
        backgroundColor: const Color(0xFFF0ECE9),
        builder: (BuildContext context) => SingleChildScrollView(
          child:  Column(
                  children: <Widget>[
                    const SizedBox(
                      height: UILayout.small,
                    ),
                    const SizedBox(
                      width: 48,
                      child: Divider(
                        height: 4,
                        thickness: 4,
                      ),
                    ),
                    const SizedBox(
                      height: UILayout.medium,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: UILayout.medium,
                      ),
                      child: CandidatureCardDetail(
                        name: name,
                        candidature: candidate,
                      ),
                    ),
                    const SizedBox(
                      height: UILayout.medium,
                    ),
                    Text('Info adicional'),
                    const SizedBox(
                      height: UILayout.medium,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: UILayout.medium,
                      ),
                      child: SunsetButton(
                        text: 'Iniciar chat'.tr,
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute<dynamic>(
                          //     builder: (BuildContext context) => ChatPage(
                          //       receiverUserEmail: tutor.email ?? '',
                          //       receiverUserID: tutor.uid ?? '',
                          //       tutorModel: tutor,
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: UILayout.medium,
                        vertical: UILayout.small,
                      ),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          'Agendar monitoría'.tr,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
          
      
      );
}
