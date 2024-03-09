part of com.curi.app.callseslist.widgets;

class AddSubjectCard extends StatefulWidget {
  const AddSubjectCard({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  State<AddSubjectCard> createState() => _AddSubjectCardState();
}

class _AddSubjectCardState extends State<AddSubjectCard> {
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
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Añade más materias',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF302A2A),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Inscribe materias!',
                      style: TextStyle(
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
