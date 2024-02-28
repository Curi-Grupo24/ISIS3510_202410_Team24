part of com.curi.app.auth.pages;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Text('hi'.tr),
    );
}
