part of com.curi.app.auth.pages;

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController mailController = TextEditingController();
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
        body: Padding(
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
                const Center(
                  child: Text(
                    'espacio para logo',
                  ),
                ),
                Spacing.spacingV48,
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
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );
}
