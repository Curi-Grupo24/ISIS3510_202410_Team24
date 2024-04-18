part of com.curi.app.enrollasmonitor.pages;

class ResultEnrollmentView extends StatelessWidget {
  const ResultEnrollmentView({super.key});

  @override
  Widget build(BuildContext context) {
    ClassModel classToApply = Get.arguments;

    return Scaffold(
      backgroundColor: Colors.jelly[40],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(UILayout.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: UILayout.medium,
                ),
                Text(
                  '¡Aplicaste!'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white[0],
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: UILayout.medium,
                ),
                Image.asset(
                  'assets/images/image_enrollment.png',
                  height: 180,
                ),
                const SizedBox(
                  height: UILayout.medium,
                ),
                Text(
                  '¡Has aplicado como monitor para ${classToApply.className}!'
                      .tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white[0],
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: UILayout.medium,
                ),
                Text(
                  'Espera confirmación en unos días'.tr,
                  style: TextStyle(
                    color: Colors.white[0],
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: UILayout.medium,
                ),
                SunsetButton(
                  text: 'Aceptar',
                  onPressed: () {
                    Get.offAndToNamed('/dashboard_home');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
