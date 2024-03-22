part of com.curi.app.callseslist.widgets;

class SunsetCardFollow extends StatefulWidget {
  const SunsetCardFollow({
    required this.onPressed,
    this.title = 'Añade más materias',
    this.description = 'Inscribe materias!',
    super.key,
  });

  final VoidCallback onPressed;
  final String title;
  final String description;

  @override
  State<SunsetCardFollow> createState() => _SunsetCardFollowState();
}

class _SunsetCardFollowState extends State<SunsetCardFollow> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color(0xFFFFEFBB),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            height: 96,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                       widget. title,
                        style: const  TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF302A2A),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.description,
                        style: const  TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF202D39),
                        ),
                      ),
                    ],
                  ),
                  FloatingActionButton(
                    elevation: 0,
                    backgroundColor: const Color(0xFFF3962E),
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
