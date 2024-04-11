part of com.curi.app.callseslist.widgets;

class SubjectCard extends StatefulWidget {
  const SubjectCard({
    required this.subjectTitle,
    required this.profesor,
    required this.time,
    required this.onTap,
    this.type,
    this.image = 'assets/images/image_asset1.png',
    this.isForAdding = false,
    super.key,
  });

  final String subjectTitle;
  final String profesor;
  final String time;
  final void Function()? onTap;
  final String? type;
  final String? image;
  final bool isForAdding;
  // final String heroTag;

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
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 96,
                          width: 96,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Image.asset(
                                widget.image!,
                                width: 85,
                                height: 85,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
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
                                const SizedBox(height: UILayout.medium),
                                if (widget.type != null)
                                  Text(
                                    widget.type!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF94A3B8),
                                    ),
                                  ),
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
                        ),
                      ],
                    ),
                  ),
                  if (widget.isForAdding)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: FloatingActionButton(
                        heroTag: widget.subjectTitle,
                        elevation: 0,
                        backgroundColor: const Color(0xFFF3962E),
                        onPressed: widget.onTap,
                        child: const Icon(Icons.add),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
}
