part of com.curi.app.callseslist.widgets;

class SubjectCard extends StatefulWidget {
  const SubjectCard({
    required this.subjectTitle,
    required this.profesor,
    required this.time,
    required this.onTap,
    super.key,
  });

  final String subjectTitle;
  final String profesor;
  final String time;
  final void Function()? onTap;

  @override
  State<SubjectCard> createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: widget.onTap,
    child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: DecoratedBox(
            decoration: BoxDecoration(
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
              width: MediaQuery.of(context).size.width - 32,
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    height: 96,
                    width: 96,
                    //child: Image.asset('assets/image.png'), //TODO: agregar imagen
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      top: 16,
                      right: 8,
                      bottom: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.subjectTitle,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF151D0C),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          widget.profesor,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                        Text(
                          widget.time,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
  );
}
