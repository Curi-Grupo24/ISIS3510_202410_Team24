part of com.curi.app.auth.pages;

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController mailController = TextEditingController();
  final ForgotPasswordBloc forgotPasswordBloc = sl<ForgotPasswordBloc>();
  String errorMessage = '';
  String successfullEmailSent = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white[0],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.sunset[40],
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: UILayout.medium,
              vertical: 0,
            ),
            onPressed: Get.back,
          ),
        ),
        body: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          bloc: forgotPasswordBloc,
          listener: (BuildContext context, ForgotPasswordState state) async {
            if (state is ForgotPasswordError) {
              setState(() {
                errorMessage = state.errorMessage;
                successfullEmailSent = '';
              });
              Get.back();
            } else if (state is ForgotPasswordSuccessfull) {
              setState(() {
                successfullEmailSent = state.message ?? '';
                errorMessage = '';
              });
              Get.back();
            } else if (state is ForgotPasswordLoading) {
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
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(UILayout.medium),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      'welcome_to'.tr,
                      style: Headings.h4.copyWith(color: Colors.gray[90]),
                    ),
                  ),
                  Spacing.spacingV24,
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Image.asset(
                        'assets/images/LOGO_CURI.png',
                        // width: 85,
                        height: 85,
                      ),
                    ),
                  ),
                  Spacing.spacingV48,
                  if (errorMessage.isNotEmpty)
                    WarningMessage(
                      isError: true,
                      message: errorMessage,
                      padding: 0,
                    ),
                  if (successfullEmailSent.isNotEmpty)
                    WarningMessage(
                      isSuccess: true,
                      message: successfullEmailSent,
                      padding: 0,
                    ),
                  Text(
                    '¿Olvidaste tu contraseña?'.tr,
                    style: Paragraphs.large.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.gray[90],
                    ),
                  ),
                  Spacing.spacingV8,
                  Text(
                    '''Ingresa tu correo electrónico, te enviaremos un correo para poder recuperar tu contraseña.'''
                        .tr,
                    style: Paragraphs.large.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.gray[90],
                      fontSize: 14,
                    ),
                  ),
                  Spacing.spacingV24,
                  Input(
                    controller: mailController,
                    hintText: 'Correo electrónico'.tr,
                  ),
                  Spacing.spacingV32,
                  SunsetButton(
                    text: 'Aceptar',
                    onPressed: () {
                      forgotPasswordBloc
                          .add(ForgotPasswordSend(email: mailController.text));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
