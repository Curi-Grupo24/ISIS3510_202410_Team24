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
  Map<String, dynamic> userInfo = <String, dynamic>{};

  @override
  initState() {
    profileBloc.add(const GetUserInfo());
    super.initState();
  }

  Future<void> onChangedPhoto(
    XFile? tPhoto,
    Map<String, dynamic> userInformation,
  ) async {
    setState(() {
      photo = tPhoto;
    });
    if (tPhoto != null) {
      Uint8List bytes = await tPhoto.readAsBytes();
      profileBloc.add(AddProfilePicture(user: userInformation, file: bytes));
    }
  }

  Future<void> _launchURL(BuildContext context) async {
    print("-------------------------------");
    print("mercado pago");
    try {
      await launch(
        'https://mpago.li/13sbpGd',
        customTabsOption: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: CustomTabsSystemAnimation.slideIn(),
          // or user defined animation.
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
        safariVCOption: SafariViewControllerOption(
          preferredBarTintColor: Theme.of(context).primaryColor,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }

  Future<void> cameraMethod(Map<String, dynamic> userInformation) async {
    XFile? pickedImage = await ImageInterface.pickImage(ImageSource.camera);
    setState(() {
      photo = pickedImage;
      Navigator.pop(context);
    });
    await onChangedPhoto(photo, userInformation);
    if (photo == null) {
      
    } else {}
  }

  Future<void> galleryMethod(Map<String, dynamic> userInformation) async {
    XFile? pickImage = await ImageInterface.pickImage(ImageSource.gallery);
    setState(() {
      photo = pickImage;
      Navigator.pop(context);
    });
    await onChangedPhoto(photo, userInformation);
    if (photo == null) {
    
    } else {}
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
            onPressed: () {
              Get.back(result: 'should rebuild');
            },
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
                                          cameraMethod:
                                              cameraMethod(state.user!),
                                          galleryMethod:
                                              galleryMethod(state.user!),
                                        ),
                                      );
                                    },
                                    child: photo == null &&
                                            state.user!['profilePicture'] ==
                                                null
                                        ? CircleAvatar(
                                            backgroundColor: Colors.ocean[40],
                                            radius: UILayout.xlarge,
                                            child: const CircleAvatar(
                                              radius: UILayout.xlarge,
                                              backgroundImage: NetworkImage(
                                                'https://cdn.pixabay.com/photo/2018/11/13/22/01/instagram-3814082_1280.png',
                                              ),
                                            ),
                                          )
                                        : state.user?['profilePicture'] != null
                                            ? CircleAvatar(
                                                backgroundColor:
                                                    Colors.ocean[40],
                                                radius: UILayout.xlarge,
                                                child: CircleAvatar(
                                                  radius: UILayout.xlarge,
                                                  backgroundImage: NetworkImage(
                                                    state.user?[
                                                        'profilePicture'],
                                                  ),
                                                ),
                                              )
                                            : SizedBox(
                                                height: 96,
                                                width: 96,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      50,
                                                    ),
                                                    color: Colors.sunset[50],
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100,),
                                                    child: Image.file(
                                                      File(photo!.path),
                                                      fit: BoxFit.cover,
                                                    ),
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
                                  onPressed: () => _launchURL(context),
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
