part of com.curi.app.auth.pages;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacing.spacingV48,
                  Text(
                    'welcome_to'.tr,
                    style: Headings.h4.copyWith(color: Colors.gray[90]),
                  ),
                  Spacing.spacingV24,
                  Text("espacio para logo"),
                  Spacing.spacingV24,
                  Text("espacio para input de correo"),
                  Spacing.spacingV16,
                  Text("espacio para input de contraseña"),
                  Spacing.spacingV8,
                  Text('¿Olvidaste tu contraseña?'.tr),
                  Spacing.spacingV24,
                  Text('boton de ingresar'),
                  Spacing.spacingV16,
                  Text('Text span no estás registrado, registrate'),
                ],
              ),
            ),
          ),
        ),
      );
}
