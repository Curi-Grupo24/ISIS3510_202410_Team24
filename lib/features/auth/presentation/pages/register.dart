part of com.curi.app.auth.pages;

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerStudentCode = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  String actualState = 'Selecciona Carrera';
  bool isSelectedCheckbox = false;
  final RegisterBloc registerBloc = sl<RegisterBloc>();

  bool isErrorMail = false;
  bool isErrorPassword = false;
  bool isErrorConfirmPassword = false;
  bool isErrorNameField = false;
  bool isErrorPhoneField = false;
  bool isErrorStudentCode = false;
  bool isValidForm = false;

  void validateForm() {
    if (controllerEmail.text.endsWith('@uniandes.edu.co') &&
        (controllerPassword.text == controllerConfirmPassword.text) &&
        controllerName.text.isNotEmpty &&
        controllerPhone.text.isNotEmpty &&
        actualState != 'Selecciona Carrera' &&
        controllerStudentCode.text.isNotEmpty &&
        isSelectedCheckbox &&
        !isErrorPassword &&
        !isErrorConfirmPassword &&
        !isErrorNameField &&
        !isErrorPhoneField &&
        !isErrorStudentCode) {
      setState(() {
        isValidForm = true;
      });
    } else {
      setState(() {
        isValidForm = false;
      });
    }
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerName.dispose();
    super.dispose();
  }

  @override
  void initState() {
    actualState = 'Selecciona Carrera';
    isSelectedCheckbox = false;
    isValidForm = false;
    super.initState();
  }

  Future<void> signup() async {
    String mail = controllerEmail.text;
    String password = controllerPassword.text;
    String name = controllerName.text;
    String career = actualState;
    String phone = controllerPhone.text;
    String studentCode = controllerStudentCode.text;
    registerBloc.add(
      RegisterAccount(
        email: mail,
        password: password,
        name: name,
        career: career,
        phone: phone,
        studentCode: studentCode,
      ),
    );
  }

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
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: UILayout.small,
            ),
            child: Text(
              'welcome_to'.tr,
              style: Headings.mH2.copyWith(color: Colors.gray[90]),
            ),
          ),
        ),
        body: BlocBuilder<RegisterBloc, RegisterState>(
          bloc: registerBloc,
          builder: (BuildContext context, RegisterState state) {
            if (state is RegisterLoading) {
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Center(
                          child: Text(
                            'espacio para logo',
                          ),
                        ),
                        Spacing.spacingV48,
                        Text(
                          'Registro'.tr,
                          style: Paragraphs.large.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.gray[90],
                          ),
                        ),
                        Spacing.spacingV16,
                        Input(
                          maxLength: 50,
                          controller: controllerEmail,
                          hintText: 'Correo Uniandes'.tr,
                          suffix: TooltipOcean(
                            text: 'Debes iniciar sesión con tu cuenta uniandes.'
                                .tr,
                          ),
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
                          suffix: TooltipOcean(
                            text:
                                'La contraseña debe tener mínimo 8 caracteres y máximo 16, estar compuesta por lo menos de una minúscula, una mayúscula, un número y/o un carácter especial entre *, -, #.'
                                    .tr,
                          ),
                          controller: controllerPassword,
                          hintText: 'password'.tr,
                          isPassword: true,
                          maxLength: 16,
                          error: isErrorPassword
                              ?'Ingresa una contraseña valida':null,
                          onChange: (String value) {
                            bool hasLowercase =
                                RegExp(r'[a-z]').hasMatch(value);
                            bool hasUppercase =
                                RegExp(r'[A-Z]').hasMatch(value);
                            bool hasDigit = RegExp(r'\d').hasMatch(value);
                            bool hasSpecialChar =
                                RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                                    .hasMatch(value);
                            setState(() {
                              isErrorPassword = !(hasLowercase &&
                                  hasUppercase &&
                                  (hasDigit || hasSpecialChar) &&
                                  value.length >= 8 &&
                                  value.length <= 16);
                            });
                            validateForm();
                          },
                        ),
                        Spacing.spacingV16,
                        Input(
                          controller: controllerConfirmPassword,
                          hintText: 'Confirmar contraseña'.tr,
                          isPassword: true,
                          error: isErrorConfirmPassword?
                              'Las contraseñas deben coincidir':null,
                          onChange: (String value) {
                            setState(() {
                              isErrorConfirmPassword =
                                  !(controllerConfirmPassword.text ==
                                      controllerPassword.text);
                            });
                            validateForm();
                          },
                        ),
                        Spacing.spacingV16,
                        Input(
                          controller: controllerName,
                          hintText: 'Nombre'.tr,
                          error: isErrorNameField
                              ?'El campo es obligatorio':null,
                          formatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z]'),
                            ),
                          ],
                          onChange: (String value) {
                            setState(() {
                              isErrorNameField = value.isEmpty;
                            });
                            validateForm();
                          },
                        ),
                        Spacing.spacingV16,
                        Input(
                          controller: controllerPhone,
                          hintText: 'Celular'.tr,
                          keyboardType: TextInputType.number,
                          formatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          error: isErrorPhoneField
                              ?'El campo es obligatorio':null,
                          maxLength: 10,
                          onChange: (String value) {
                            setState(() {
                              isErrorPhoneField = value.isEmpty;
                            });
                            validateForm();
                          },
                        ),
                        Spacing.spacingV16,
                        DropDownButtonCarreer(
                          actualState: actualState,
                          onPressed: showModalStates,
                          isDefaultState: actualState != 'Selecciona Carrera',
                          onPressedCrossIcon: () {
                            setState(() {
                              actualState = 'Selecciona Carrera';
                            });
                            validateForm();
                          },
                        ),

                        Spacing.spacingV8,
                        Spacing.spacingV16,
                        Input(
                          controller: controllerStudentCode,
                          hintText: 'Código estudiantil'.tr,
                          keyboardType: TextInputType.number,
                          formatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxLength: 10,
                          error: isErrorStudentCode
                              ?'El campo es obligatorio':null,
                          onChange: (String value) {
                            setState(() {
                              isErrorStudentCode = value.isEmpty;
                            });
                            validateForm();
                          },
                        ),

                        Spacing.spacingV32,
                        //checkbox de términos y condiciones.
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: isSelectedCheckbox,
                              onChanged: (bool? isSelected) {
                                setState(() {
                                  isSelectedCheckbox = isSelected ?? false;
                                });
                                validateForm();
                              },
                              fillColor: MaterialStateProperty.all<Color>(
                                Colors.white[0]!,
                              ),
                              activeColor: Colors.ocean[40],
                              checkColor: Colors.ocean[40],
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Acepto los '.tr,
                                      style: TextStyle(
                                        color: Colors.gray[80],
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Términos y condiciones '.tr,
                                      style: TextStyle(
                                        color: Colors.ocean[40],
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.dialog(
                                            const TermsAndConditionsPage(),
                                            barrierDismissible: true,
                                            barrierColor: Colors.gray[90]!
                                                .withOpacity(.7),
                                            useSafeArea: false,
                                          );
                                        },
                                    ),
                                    TextSpan(
                                      text: 'de uso de la aplicación'.tr,
                                      style: TextStyle(
                                        color: Colors.gray[80],
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacing.spacingV32,
                        SunsetButton(
                          text: 'Registrarme'.tr,
                          onPressed: isValidForm ? signup : null,
                          backgroundColor: !isValidForm
                              ? Colors.gray[50]
                              : Colors.sunset[50],
                        ),
                        Spacing.spacingV32,
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      );

  Future<dynamic> showModalStates() {
    List<String> possibleStates = <String>[
      'Ingeniería de Sistemas'.tr,
      'Ingeniería mecánica'.tr,
      'Ingeniería industrial'.tr,
    ];
    return showModalBottomSheet(
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
                  'select_carreer'.tr,
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
                  ...possibleStates.map(
                    (String carreersState) => SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            actualState = carreersState;
                          });
                          validateForm();
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
}
