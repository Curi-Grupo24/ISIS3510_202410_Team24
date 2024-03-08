part of com.curi.app.commonwidgets.widgets;

class TooltipOcean extends StatelessWidget {
  const TooltipOcean({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) => ElTooltip(
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white[0],
              fontSize: UILayout.medium,
            ),
          ),
        ),
        timeout: const Duration(seconds: 3),
        appearAnimationDuration: const Duration(
          milliseconds: 150,
        ),
        disappearAnimationDuration: const Duration(
          milliseconds: 150,
        ),
        position: ElTooltipPosition.topEnd,
        showModal: false,
        color: Colors.ocean[50]!,
        showChildAboveOverlay: false,
        child: Icon(
          Icons.info_outline,
          color: Colors.ocean[50],
        ),
      );
}
