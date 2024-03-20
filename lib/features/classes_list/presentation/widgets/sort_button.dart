part of com.curi.app.callseslist.widgets;

class SortButton extends StatefulWidget {
  const SortButton({required this.text, super.key});

  final String text;

  @override
  State<SortButton> createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color(0xFFFAFAFA),
            border: Border.all(
              color: const Color(0xFFEEEEEE),
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: const Offset(-2, 3),
                blurRadius: 2,
                spreadRadius: 10,
                blurStyle: BlurStyle.outer,
                color: Colors.black[0]!.withOpacity(0.05),
              ),
            ],
          ),
          child: SizedBox(
            width: 92,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.text,
                  style: const TextStyle(
                    fontFamily: 'Roboto', //TODO:
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF000000),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      );
}
