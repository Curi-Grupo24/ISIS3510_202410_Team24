part of com.curi.app.callseslist.widgets;

class SortButton extends StatefulWidget {
  const SortButton({
    required this.text,
    this.onPressed,
    this.crossEnabled = false,
    this.onCrossTapped,
    super.key,
  });

  final String text;
  final void Function()? onPressed;
  final void Function()? onCrossTapped;
  final bool crossEnabled;

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
      ),
      child: SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap:  widget.onPressed,
                child: Row(
                  children: <Widget>[
                    Text(
                      widget.text,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF000000),
                      ),
                    ),
                    if (!widget.crossEnabled)
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 24,
                      ),
                  ],
                ),
              ),
              if (widget.crossEnabled)
                GestureDetector(
                  onTap: widget.onCrossTapped,
                  child: const Icon(
                    Icons.close,
                    size: 24,
                  ),
                ),
            ],
          ),
        ),
      ),
    ),
  );
}
