part of com.curi.app.commonwidgets.widgets;

class WarningMessage extends StatelessWidget {
  const WarningMessage({
    required this.message,
    this.padding = 16,
    this.isError = false,
    this.isSuccess = false,
    super.key,
  });
  final String message;
  final double padding;
  final bool isError;
  final bool isSuccess;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Card(
          elevation: 0,
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            tileColor: isError
                ? Colors.blooming[5]
                : isSuccess
                    ? Colors.ocean[5]
                    : Colors.sunset[5],
            dense: true,
            leading: Icon(
             isSuccess ? Icons.mail : Icons.warning_amber_rounded,
              color: isError
                  ? Colors.blooming[30]
                  : isSuccess
                      ? Colors.ocean[40]
                      : Colors.sunset[30],
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 14,
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
