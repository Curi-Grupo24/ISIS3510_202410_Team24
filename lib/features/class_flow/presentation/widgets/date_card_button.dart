part of com.curi.app.classflow.widgets;

class DateCardButton extends StatelessWidget {
  const DateCardButton({
    required this.number,
    required this.day,
    required this.onSelected,
    this.isSelected = false,
    super.key,
  });
  final String number;
  final String day;
  final void Function()? onSelected;
  final bool isSelected;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onSelected,
        child: Card(
          color: isSelected ? Colors.jelly[20] : Colors.gray[30],
          child: Padding(
            padding: const EdgeInsets.all(UILayout.medium),
            child: Column(
              children: <Widget>[
                Text(
                  number,
                  style: TextStyle(
                    color: isSelected ? Colors.white[0] : Colors.gray[70],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  day,
                  style: TextStyle(
                    color: isSelected ? Colors.white[0] : Colors.gray[70],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
