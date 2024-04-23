part of com.curi.app.mytutorsclassflow.pages;

class WaitingConfirmation extends StatelessWidget {
  const WaitingConfirmation({super.key});

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
            onPressed: Get.back,
          ),
          title: const Text(
            'Esperando confirmación',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: UILayout.medium,
              fontWeight: FontWeight.w800,
              color: Color(0xFF111007),
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(UILayout.medium),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/image_waiting.png',
                    height: 250,
                  ),
                  const SizedBox(
                    height: UILayout.medium,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '''De momento debes esperar a que confirmemos tu información, esperamos pronto seas parte de nuestro equipo!'''
                              .tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.gray[90],
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: UILayout.medium,
                  ),
                  SunsetButton(
                    text: 'Aceptar',
                    onPressed: Get.back,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
