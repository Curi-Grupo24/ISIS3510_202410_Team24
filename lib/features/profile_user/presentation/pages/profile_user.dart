part of com.curi.app.profileuser.pages;

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  XFile? photo;
  ProfileBloc profileBloc = ProfileBloc();
  String username = '';

  @override
  initState() {
    profileBloc.add(const GetUserInfo());
    super.initState();
  }

  void onChangedPhoto(XFile? tPhoto) {
    setState(() {
      photo = tPhoto;
    });
    // widget.onChangedPhoto(photo);
  }

  Future<void> cameraMethod() async {
    XFile? pickedImage = await ImageInterface.pickImage(ImageSource.camera);
    setState(() {
      photo = pickedImage;
      Navigator.pop(context);
    });
    onChangedPhoto(photo);
    if (photo == null) {
      return;
    } else {
      // scannedText = await scannedRepository.scannedImage(photo);

      // data = scannedRepository.organizeData(
      //   scannedRepository.formatText(scannedText!),
      // );

      // for (int i = 0; i < data!.length; i++) {
      //   codesControllers.add(TextEditingController());
      //   viaControllers.add(TextEditingController());
      // }

      // onChangedCodes(data);
    }
  }

  Future<void> galleryMethod() async {
    XFile? pickImage = await ImageInterface.pickImage(ImageSource.gallery);
    setState(() {
      photo = pickImage;
      Navigator.pop(context);
    });
    onChangedPhoto(photo);
    if (photo == null) {
      return;
    } else {
      // scannedText = await scannedRepository.scannedImage(photo);

      // data = scannedRepository.organizeData(scannedText!);

      // for (int i = 0; i < data!.length; i++) {
      //   codesControllers.add(TextEditingController());
      //   viaControllers.add(TextEditingController());
      // }

      // onChangedCodes(data);
    }
  }

  Future<ImageProvider<Object>> xFileToImage(XFile? xFile) async {
    if (xFile != null) {
      Uint8List bytes = await xFile.readAsBytes();
      return Image.memory(bytes).image;
    } else {
      return const NetworkImage(
        'https://picsum.photos/id/237/200/300',
      );
    }
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
          title: const Text(
            'Perfil',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: UILayout.medium,
              fontWeight: FontWeight.w800,
              color: Color(0xFF111007),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<ProfileBloc, ProfileState>(
            bloc: profileBloc,
            builder: (BuildContext context, ProfileState state) {
              if (state is ProfileLoading) {
                return SpinKitRotatingCircle(
                  color: Colors.sunset[20],
                  size: 50,
                );
              } else if (state is ProfileSuccessfull) {
                return Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.sunset[50]!.withOpacity(0.3),
                            ),
                            child: Column(
                              children: <Widget>[
                                Spacing.spacingV24,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: UILayout.medium,
                                  ),
                                  child: GestureDetector(
                                    onTap: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (BuildContext ctx) =>
                                            ImagePickerModal(
                                          cameraMethod: cameraMethod,
                                          galleryMethod: galleryMethod,
                                        ),
                                      );
                                    },
                                    child: photo == null
                                        ? CircleAvatar(
                                            backgroundColor: Colors.ocean[40],
                                            radius: UILayout.large,
                                            child: const CircleAvatar(
                                              radius: UILayout.xlarge,
                                              backgroundImage: NetworkImage(
                                                'https://picsum.photos/id/237/200/300',
                                              ),
                                            ),
                                          )
                                        : SizedBox(
                                          height: UILayout.xlarge,
                                          width: UILayout.xlarge,
                                          child: CircleAvatar(
                                            radius: UILayout.xlarge,
                                            child: Image.file(
                                              File(photo!.path),
                                            ),
                                          ),
                                        ),
                                  ),
                                ),
                                Text(
                                  state.user?['name'],
                                  style: TextStyle(
                                    fontSize: UILayout.large,
                                    color: Colors.gray[90],
                                  ),
                                ),
                                Spacing.spacingV24,
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Tipo de usuario',
                                  style: TextStyle(
                                    fontSize: UILayout.medium,
                                    color: Colors.gray[90],
                                  ),
                                ),
                                Text(
                                  '${state.user?['type']}'.tr,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.sunset[50],
                                  ),
                                ),
                                const SizedBox(
                                  height: UILayout.small,
                                ),
                                Text(
                                  'Contacto',
                                  style: TextStyle(
                                    fontSize: UILayout.medium,
                                    color: Colors.gray[90],
                                  ),
                                ),
                                Text(
                                  state.user?['phone'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.sunset[50],
                                  ),
                                ),
                                const SizedBox(
                                  height: UILayout.small,
                                ),
                                Text(
                                  'Carrera',
                                  style: TextStyle(
                                    fontSize: UILayout.medium,
                                    color: Colors.gray[90],
                                  ),
                                ),
                                Text(
                                  state.user?['career'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.sunset[50],
                                  ),
                                ),
                                const SizedBox(
                                  height: UILayout.small,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: UILayout.large,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: UILayout.medium,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: UILayout.medium,
                            ),
                            child: Column(
                              children: <Widget>[
                                SunsetButton(
                                  text: 'Agendar monitoría'.tr,
                                  backgroundColor: Colors.jelly[40],
                                ),
                                Spacing.spacingV16,
                              ],
                            ),
                          ),
                          Spacing.spacingV12,
                          Text(
                            'reviews',
                            style: TextStyle(
                              color: Colors.gray[90],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacing.spacingV12,
                          Center(
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/pana.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                ),
                                Spacing.spacingV12,
                                Text(
                                  'No hay reviews aún'.tr,
                                  style: TextStyle(
                                    color: Colors.gray[90],
                                    fontSize: UILayout.medium,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '''Aún no hay ninguna review, pero, puedes dar monitorías para que veas tus reviews y tus estadisticas''',
                                  style: TextStyle(color: Colors.gray[70]),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          SunsetButton(
                            text: 'Cerrar sesión'.tr,
                            backgroundColor: Colors.jelly[40],
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              Get.offAllNamed('/login');
                            },
                          ),
                        ],
                      ),
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
      );
}
