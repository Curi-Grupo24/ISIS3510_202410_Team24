part of com.curi.app.classflow.pages;

class FindTutorsView extends StatefulWidget {
  const FindTutorsView({super.key});

  @override
  State<FindTutorsView> createState() => _FindTutorsViewState();
}

class _FindTutorsViewState extends State<FindTutorsView> {
  String className = '';
  String type = '';
  TextEditingController? controller = TextEditingController();
  String filterRating = 'Calificación';
  String filterPrice = 'Precio';
  String errorMessageFav = '';
  String successMessage = '';
  List<TutorModel> tutorsList = <TutorModel>[];
  List<String> possibleFiltersStates = <String>[
    'Menor a mayor',
    'Mayor a menor',
  ];
  FavTutorsBloc favTutorsBloc = FavTutorsBloc();

  @override
  void initState() {
    super.initState();
    className = Get.parameters['className'] ?? '';
    type = Get.parameters['type'] ?? 'none';
    tutorsList = Get.arguments['tutors'];
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
            onPressed: Get.back,
          ),
          title: Text(
            className,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: UILayout.medium,
              fontWeight: FontWeight.w800,
              color: Color(0xFF111007),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocListener<FavTutorsBloc, FavTutorsState>(
              bloc: favTutorsBloc,
              listener: (BuildContext context, FavTutorsState state) async {
                if (state is SaveTutorFavsLoading) {
                  await showDialog(
                    context: context,
                    builder: (BuildContext ctx) => SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: SpinKitRotatingCircle(
                        color: Colors.sunset[20],
                        size: 50,
                      ),
                    ),
                  );
                } else if (state is SaveTutorFavsError) {
                  Get.back();
                  setState(() {
                    errorMessageFav = state.errorMessage;
                  });
                } else if (state is SaveTutorFavsInfoSuccessful) {
                  Get.back();
                  setState(() {
                    successMessage = state.successMessage;
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: UILayout.medium,
                ),
                child: tutorsList.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: UILayout.small,
                          ),
                          if (errorMessageFav.isNotEmpty)
                            WarningMessage(
                              isError: true,
                              message: errorMessageFav,
                              padding: 0,
                            ),
                          if (successMessage.isNotEmpty)
                            WarningMessage(
                              isSuccess: true,
                              message: successMessage,
                              padding: 0,
                            ),
                          Text(
                            'Monitores disponibles'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.gray[90],
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: UILayout.medium,
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              minHeight: 90,
                              maxHeight: 90,
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: tutorsList.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  GestureDetector(
                                onTap: () {
                                  tutorModalDetail(
                                    context,
                                    name: tutorsList[index].name,
                                    tutor: tutorsList[index],
                                  );
                                },
                                child: SizedBox(
                                  width: 80,
                                  height: 90,
                                  child: CircleAvatar(
                                    radius: 120,
                                    backgroundImage: NetworkImage(
                                      tutorsList[index].profilePicture ??
                                          'https://static.vecteezy.com/system/resources/thumbnails/036/280/651/small_2x/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg',
                                    ),
                                  ),
                                ),
                              ),
                              separatorBuilder: (_, int index) =>
                                  const SizedBox(
                                width: 8,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: UILayout.medium,
                          ),
                          SearchInput(
                            hintText: 'Name',
                            controller: controller,
                            onChangedController: (String value) {
                              // updateFilterDef();
                            },
                            paddingInput: const EdgeInsets.all(0),
                          ),
                          const SizedBox(
                            height: UILayout.medium,
                          ),
                          Text(
                            'Filtrar por',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.gray[90],
                            ),
                          ),
                          const SizedBox(
                            height: UILayout.small,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                if (filterRating != 'Calificación')
                                  const Text('Calificación'),
                                SortButton(
                                  text: filterRating,
                                  onPressed: () {
                                    showModalStatesToFilter(
                                      possibleFiltersStates,
                                      'Escoge el filtro de Calificación'.tr,
                                      parentAction: (String value) {
                                        setState(() {
                                          filterRating = value;
                                        });
                                        // updateFilterDef();
                                      },
                                    );
                                  },
                                  crossEnabled: filterRating != 'Calificación',
                                  onCrossTapped: () {
                                    setState(() {
                                      filterRating = 'Calificación';
                                    });
                                    // updateFilterDef();
                                  },
                                ),
                                const SizedBox(
                                  width: UILayout.small,
                                ),
                                if (filterPrice != 'Precio')
                                  const Text('Precio'),
                                SortButton(
                                  text: filterPrice,
                                  onPressed: () {
                                    showModalStatesToFilter(
                                      possibleFiltersStates,
                                      'Escoge el filtro de Precio'.tr,
                                      parentAction: (String value) {
                                        setState(() {
                                          filterPrice = value;
                                        });
                                        // updateFilterDef();
                                      },
                                    );
                                  },
                                  crossEnabled: filterPrice != 'Precio',
                                  onCrossTapped: () {
                                    setState(() {
                                      filterPrice = 'Precio';
                                    });
                                    // updateFilterDef();
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: UILayout.medium,
                          ),
                          ...tutorsList.map(
                            (TutorModel tutor) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: UILayout.medium,
                              ),
                              child: FavTutorsCard(
                                name: tutor.name,
                                rate: tutor.rate ?? '',
                                price: tutor.price ?? '',
                                image: tutor.profilePicture ??
                                    'https://static.vecteezy.com/system/resources/thumbnails/036/280/651/small_2x/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg',
                                onTap: () {
                                  tutorModalDetail(
                                    context,
                                    name: tutor.name,
                                    tutor: tutor,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(
                              height: 42,
                            ),
                            Image.asset(
                              'assets/images/image_asset7.png',
                              height: 110,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                '''En este momento no hay monitores disponibles :c, vuelve a revisar en unos días :D''',
                                style: TextStyle(color: Colors.gray[70]),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ),
      );
  Future<dynamic> tutorModalDetail(
    BuildContext context, {
    required String name,
    required TutorModel tutor,
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
          child: Stack(
            children: <Widget>[
              InkWell(
                child: Column(
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
                      child: MonitorCardDetail(
                        name: name,
                        tutor: tutor,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) => ChatPage(
                                receiverUserEmail: tutor.email ?? '',
                                receiverUserID: tutor.uid ?? '',
                                tutorModel: tutor,
                              ),
                            ),
                          );
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
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 12, 0, 0),
                child: LikeButton(
                  onPressed: (bool pressed) {
                    if (pressed) {
                      favTutorsBloc.add(SaveTutorToFavs(tutorToSave: tutor));
                    } else {
                      favTutorsBloc.add(DeleteToFavs(tutorToSave: tutor));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
  Future<dynamic> showModalStatesToFilter(
    List<String> possibleFilters,
    String titleModal, {
    required ValueChanged<String> parentAction,
  }) =>
      showModalBottomSheet(
        backgroundColor: Colors.white[0],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(19),
          ),
        ),
        context: context,
        builder: (BuildContext context) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  child: Text(
                    titleModal,
                    style: TextStyle(
                      color: Colors.gray[90],
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: IconButton(
                    iconSize: 18,
                    onPressed: Get.back,
                    icon: Icon(
                      Icons.close,
                      color: Colors.gray[90],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 1),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ...possibleFilters.map(
                      (String carreersState) => SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            parentAction(carreersState);
                            Get.back();
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(
                                  MaterialState.pressed,
                                )) {
                                  return Colors.sunset[50]!;
                                } else {
                                  return Colors.white[0]!;
                                }
                              },
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                              ),
                              child: Text(
                                carreersState,
                                style: TextStyle(
                                  color: Colors.gray[90],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
