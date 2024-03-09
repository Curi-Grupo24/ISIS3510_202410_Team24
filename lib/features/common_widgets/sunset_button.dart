part of com.curi.app.commonwidgets.widgets;

class SunsetButton extends StatelessWidget {
  const SunsetButton({
    required this.text,
    this.onPressed,
    this.backgroundColor = defaultBackgroundColor,
    super.key,
  });
  static const Color defaultBackgroundColor = Color.fromRGBO(243, 150, 46, 1);

  final String text;
  final void Function()? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor!,
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
            const EdgeInsets.all(0),
          ),
        ),
        onPressed: onPressed,
        child: Column(
          children: <Widget>[
            const SizedBox(
              width: double.infinity,
            ),
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white[0],
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
}
