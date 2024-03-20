part of com.curi.app.enrollasmonitor.pages;

class OnbordingView extends StatefulWidget {
  const OnbordingView({Key? key}) : super(key: key);
  static const String route = '/risk-profile/onbording';

  @override
  State<OnbordingView> createState() => _OnbordingViewStateCL();
}

class _OnbordingViewStateCL extends State<OnbordingView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: Colors.jelly[40],
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(UILayout.mlarge),
            child: Visibility(
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.jelly[40],
                leading: IconButton(
                  onPressed: Get.back,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: UILayout.large,
                    color: Colors.white[0],
                  ),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                UILayout.medium,
                UILayout.xlarge,
                UILayout.medium,
                UILayout.large,
              ),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Image.asset(
                        'assets/images/onboarding_enroll_image.png',
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                    ),
                  ),
                  Spacing.spacingV32,
                  Text(
                    'Queremos conocerte un poco'.tr,
                    textAlign: TextAlign.center,
                    style: Headings.h5.copyWith(
                      color: Colors.white[0],
                    ),
                  ),
                  Spacing.spacingV16,
                  Text(
                    '''Te haremos una pequeña encuesta para identificar tu perfil.  Al finalizar, revisaremos tu información y te notificaremos cuando tengas acceso a las funcionalidades de monitor.'''
                        .tr,
                    textAlign: TextAlign.center,
                    style: Paragraphs.small.copyWith(
                      color: Colors.white[0],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              Container(
                color: Colors.jelly[10],
                height: 220,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: UILayout.medium,
                  vertical: UILayout.medium,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Spacing.spacingV24,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        '¡No tomará más de 2 minutos!'.tr,
                        textAlign: TextAlign.center,
                        style: Headings.h7.copyWith(
                          color: Colors.white[0],
                        ),
                      ),
                    ),
                    Spacing.spacingV32,
                    const FooterActionsIntroEnroll(),
                  ],
                ),
              ),
              Positioned(
                top: -UILayout.large,
                child: Container(
                  height: UILayout.xlarge,
                  width: UILayout.xlarge,
                  decoration: BoxDecoration(
                    color: Colors.jelly[10],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.hourglass_empty,
                    color: Colors.white[0],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
