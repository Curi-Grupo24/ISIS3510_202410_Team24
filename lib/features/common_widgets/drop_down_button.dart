part of com.curi.app.commonwidgets.widgets;

class DropDownButtonCarreer extends StatelessWidget {
  const DropDownButtonCarreer({
    required this.actualState,
    required this.isDefaultState,
    required this.onPressed,
    required this.onPressedCrossIcon,
    super.key,
  });

  final String actualState;
  final bool isDefaultState;
  final void Function()? onPressedCrossIcon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.gray[10],
          border: Border(
            bottom: BorderSide(color: Colors.gray[80]!, width: 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: onPressed,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          actualState,
                          style: TextStyle(
                            fontSize: UILayout.medium,
                            color: Colors.gray[90],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.gray[90],
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
              if (isDefaultState)
                Padding(
                  padding: const EdgeInsets.only(
                    right: 12,
                    left: 4,
                  ),
                  child: GestureDetector(
                    onTap: onPressedCrossIcon,
                    child: Icon(
                      Icons.close,
                      color: Colors.gray[80],
                      size: 20,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
}
