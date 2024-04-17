part of com.curi.app.callseslist.widgets;

class SunsetCardFollow extends StatefulWidget {
  const SunsetCardFollow({
    required this.onPressed,
    this.title = 'Añade más materias',
    this.description = 'Inscribe materias!',
    this.backgroundColor = const Color(0xFFFFEFBB),
    this.buttonColor = const Color(0xFFF3962E),
    super.key,
  });

  final VoidCallback onPressed;
  final String title;
  final String description;
  final Color? backgroundColor;
  final Color? buttonColor;

  @override
  State<SunsetCardFollow> createState() => _SunsetCardFollowState();
}

class _SunsetCardFollowState extends State<SunsetCardFollow> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF302A2A),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          widget.description,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF202D39),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  FloatingActionButton(
                    heroTag: widget.title,
                    elevation: 0,
                    backgroundColor: widget.buttonColor,
                    onPressed: widget.onPressed,
                    child: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
