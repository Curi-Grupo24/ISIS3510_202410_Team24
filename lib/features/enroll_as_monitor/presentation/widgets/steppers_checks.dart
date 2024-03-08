part of com.curi.app.enrollasmonitor.widgets;

class StepperChecks extends StatelessWidget {
  const StepperChecks({
    required this.steps,
    required this.currentStep,
    required this.activeColor,
    required this.inactiveColor,
    this.width,
    this.lineWidth = 4,
    Key? key,
  }) : super(key: key);

  final int steps;
  final int currentStep;
  final Color activeColor;
  final Color inactiveColor;
  final double? lineWidth;
  final double? width;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SizedBox(
          width: width,
          child: Row(
            children: _buildBody(),
          ),
        ),
      );

  List<Widget> _buildBody() {
    List<Widget> widgets = <Widget>[];
    for (int index = 0; index < steps; index++) {
      widgets.add(
        Container(
          width: UILayout.medium,
          height: UILayout.medium,
          decoration: BoxDecoration(
            color: _getCircleColor(index),
            shape: BoxShape.circle,
          ),
          child: index < currentStep
              ? Icon(
                Icons.check,
                  color: activeColor,
                  size: UILayout.medium,
                )
              : const SizedBox.shrink(),
        ),
      );
      if (index < steps - 1) {
        widgets.add(
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: lineWidth,
              decoration: BoxDecoration(
                color: index < currentStep ? activeColor : inactiveColor,
                borderRadius: BorderRadius.circular(UILayout.small),
              ),
            ),
          ),
        );
      }
    }

    return widgets;
  }

  Color _getCircleColor(int index) {
    if (currentStep == index) {
      return Colors.sunset[10]!;
    } else if (index < currentStep) {
      return Colors.transparent;
    } else {
      return Colors.sunset[20]!;
    }
  }
}
