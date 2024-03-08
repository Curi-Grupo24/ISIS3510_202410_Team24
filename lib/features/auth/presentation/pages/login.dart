part of com.curi.app.auth.pages;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController useernameMailController =  TextEditingController();
  TextEditingController? passwordControler = TextEditingController();
  bool isErrorMail = false;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacing.spacingV48,
                  Text(
                    'welcome_to'.tr,
                    style: Headings.h4.copyWith(color: Colors.gray[90]),
                  ),
                  Spacing.spacingV24,
                  Text(
                    "espacio para logo",
                  ),
                  Spacing.spacingV48,
                  Input(
                    controller: useernameMailController,
                    hintText: 'username_mail'.tr,
                  ),
                  Spacing.spacingV16,
                  Input(
                    suffix: Icon(
                      Icons.remove_red_eye,
                      color: Colors.gray[80],
                    ),
                    controller: passwordControler,
                    hintText: 'password'.tr,
                    isPassword: true,
                  ),
                  Spacing.spacingV8,
                  Text(
                    'forgot_your_password'.tr,
                    style: TextStyle(
                      color: Colors.gray[80],
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  Spacing.spacingV24,
                  SunsetButton(
                    text: 'log_in'.tr,
                    onPressed: () {},
                  ),
                  Spacing.spacingV16,
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/register');
                    },
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'dont_have_an_account'.tr,
                            style: TextStyle(
                              color: Colors.gray[80],
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: 'Regístrate'.tr,
                            style: TextStyle(
                              color: Colors.gray[90],
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
