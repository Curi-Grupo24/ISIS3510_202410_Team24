part of com.curi.app.administrator.pages;

class AdministratorHome extends StatefulWidget {
  const AdministratorHome({super.key});

  @override
  State<AdministratorHome> createState() => _AdministratorHomeState();
}

class _AdministratorHomeState extends State<AdministratorHome> {
  DashboardBloc dashboardBloc = DashboardBloc();
  @override
  void initState() {
    dashboardBloc.add(const GetUserInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white[0],
          title: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Image.asset(
                'assets/images/LOGO_CURI.png',
                // width: 85,
                height: 32,
              ),
            ),
          ),
          centerTitle: true,
          leading: const SizedBox.shrink(),
          actions: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/notifications_home');
                  },
                  child: Icon(
                    Icons.notifications,
                    size: 24,
                    color: Colors.gray[70],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                BlocBuilder<DashboardBloc, DashboardState>(
                  bloc: dashboardBloc,
                  builder: (BuildContext context, DashboardState state) {
                    if (state is DashboardLoading) {
                      return SpinKitRotatingCircle(
                        color: Colors.sunset[20],
                        size: 40,
                      );
                    } else if (state is DashboardSuccessfull) {
                      return GestureDetector(
                        onTap: () async {
                          String shouldReload = '';
                          shouldReload = await Get.toNamed('/profile_user');
                          if (shouldReload.isNotEmpty) {
                            dashboardBloc.add(const GetUserInfo());
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.ocean[40],
                          radius: UILayout.large,
                          child: CircleAvatar(
                            radius: UILayout.xlarge,
                            backgroundImage: NetworkImage(
                              state.user.profilePicture ??
                                  'https://static.vecteezy.com/system/resources/thumbnails/036/280/651/small_2x/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg',
                            ),
                          ),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () async {
                          String shouldReload = '';
                          shouldReload = await Get.toNamed('/profile_user');
                          if (shouldReload.isNotEmpty) {
                            setState(() {});
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.ocean[40],
                          radius: UILayout.large,
                          child: const CircleAvatar(
                            radius: UILayout.xlarge,
                            backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1524135220673-c731600a1a50?q=80&w=3580&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
          ],
        ),
        body: BlocBuilder<DashboardBloc, DashboardState>(
          bloc: dashboardBloc,
          builder: (BuildContext context, DashboardState state) {
            if (state is DashboardLoading) {
              return SpinKitRotatingCircle(
                color: Colors.sunset[20],
                size: 50,
              );
            } else if (state is DashboardSuccessfull) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Bienvenido, usuario Administrador ${state.user.name}',
                        style: TextStyle(
                          color: Colors.gray[80],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SunsetCardFollow(
                      onPressed: () {
                        Get.toNamed('/candidates_list');
                      },
                      title: 'Revisa las candiaturas para monitor',
                      description: 'Evita que se acumulen',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SunsetCardFollow(
                      onPressed: () {
                        Get.toNamed('/available_classes');
                      },
                      title:
                          '''Añade y revisa las materias que ofrecemos cada semestre''',
                      description: 'Debes estar al tanto',
                      backgroundColor: Colors.ocean[5],
                      buttonColor: Colors.ocean[50],
                    ),
                  ],
                ),
              );
            } else if (state is DashboardError) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: WarningMessage(
                  isError: true,
                  message: state.errorMessage,
                  padding: 0,
                ),
              );
            } else {
              return SpinKitRotatingCircle(
                color: Colors.sunset[20],
                size: 50,
              );
            }
          },
        ),
      );
}
