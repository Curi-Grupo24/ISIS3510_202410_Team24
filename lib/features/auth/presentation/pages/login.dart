part of com.curi.app.auth.pages;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController useernameMailController = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  bool isErrorMail = false;
  bool isErrorPassword = false;
  bool isValidForm = false;
  final LoginBloc loginBloc = sl<LoginBloc>();
  @override
  void initState() {
    isValidForm = false;
    super.initState();
  }

  void validateForm() {
    if (useernameMailController.text.isNotEmpty &&
        useernameMailController.text.endsWith('@uniandes.edu.co') &&
        passwordControler.text.isNotEmpty) {
      setState(() {
        isValidForm = true;
      });
    } else {
      setState(() {
        isValidForm = false;
      });
    }
  }

  Future<void> signin() async {
    String mail = useernameMailController.text;
    String password = passwordControler.text;
    loginBloc.add(LoginAccount(email: mail, password: password));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          bloc: loginBloc,
          listener: (BuildContext context, LoginState state) {
            if (state is LoginError) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text(state.errorMessage)),
                );
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            bloc: loginBloc,
            builder: (BuildContext context, LoginState state) {
              if (state is LoginLoading) {
                return SpinKitRotatingCircle(
                  color: Colors.sunset[20],
                  size: 50,
                );
              } else {
                return SingleChildScrollView(
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
                          const Text(
                            'espacio para logo',
                          ),
                          Spacing.spacingV48,
                          Input(
                            controller: useernameMailController,
                            hintText: 'username_mail'.tr,
                            error:
                                isErrorMail ? 'Ingresa un correo valido' : null,
                            onChange: (String string) {
                              if (!string.endsWith('@uniandes.edu.co') ||
                                  string.length <= 16 ||
                                  string.contains(' ')) {
                                setState(() {
                                  isErrorMail = true;
                                });
                              } else {
                                setState(() {
                                  isErrorMail = false;
                                });
                              }
                              validateForm();
                            },
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
                            error: isErrorPassword ? 'Campo obligatorio' : null,
                            onChange: (String value) {
                              setState(() {
                                isErrorPassword = value.isEmpty;
                              });
                              validateForm();
                            },
                            maxLength: 16,
                          ),
                          Spacing.spacingV8,
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/forgot_password');
                            },
                            child: Text(
                              'forgot_your_password'.tr,
                              style: TextStyle(
                                color: Colors.gray[80],
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Spacing.spacingV24,
                          SunsetButton(
                            text: 'log_in'.tr,
                            onPressed: isValidForm ? signin : null,
                            backgroundColor: !isValidForm
                                ? Colors.gray[50]
                                : Colors.sunset[50],
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
                );
              }
            },
          ),
        ),
      );
}
