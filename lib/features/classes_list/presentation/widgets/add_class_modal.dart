part of com.curi.app.callseslist.widgets;

class AddClassesModal extends StatelessWidget {
  const AddClassesModal({
    required this.className,
    required this.onPressedAccept,
    super.key,
  });
  final String className;
  final void Function()? onPressedAccept;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Text(
            '''Estás seguro de añadir $className a tu lista de materias?''',
            style: TextStyle(
              color: Colors.gray[80],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: UILayout.medium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      BorderSide(
                        color: Colors.sunset[50]!,
                        width: 1,
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.all(0),
                    ),
                    surfaceTintColor: MaterialStateProperty.all<Color>(
                      Colors.sunset[50]!,
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.sunset[50]!,
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(
                      Colors.sunset[50]!,
                    ),
                    shadowColor: MaterialStateProperty.all<Color>(
                      Colors.sunset[50]!,
                    ),
                  ),
                  onPressed: Get.back,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        width: double.infinity,
                      ),
                      Text(
                        'Cancelar',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.sunset[50],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SunsetButton(
                  onPressed: onPressedAccept,
                  text: 'Aceptar',
                ),
              ),
            ],
          ),
        ],
      );
}
