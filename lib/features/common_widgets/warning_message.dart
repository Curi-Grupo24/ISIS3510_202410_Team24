part of com.curi.app.commonwidgets.widgets;

class WarningMessage extends StatelessWidget {
  const WarningMessage({required this.message, this.padding = 16, super.key});
  final String message;
  final double padding;

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Card(
        elevation: 0,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(color: Colors.sunset[30]!),
          ),
          tileColor: Colors.sunset[5],
          dense: true,
          leading: Icon(
            Icons.warning_amber_rounded,
            color: Colors.sunset[30],
          ),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              message,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.gray[80],
              ),
              maxLines: 8,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
    );
}
