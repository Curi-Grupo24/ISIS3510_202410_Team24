part of com.curi.app.dashboard.widgets;

class DashboardTab extends StatelessWidget {
  const DashboardTab(
    this.data, {
    required this.index,
    required this.controller,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);
  final DashboardTabData data;
  final int index;
  final bool isSelected;
  final TabController controller;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: LayoutBuilder(
            builder: (_, BoxConstraints constraints) => Stack(
              children: <Widget>[
                Positioned(
                  top: 2,
                  child: TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 300),
                    tween: Tween<double>(begin: 0, end: isSelected ? 1 : 0),
                    builder: (
                      BuildContext context,
                      double value,
                      Widget? child,
                    ) =>
                        Transform.scale(
                      scale: value,
                      alignment: const Alignment(0, -1),
                      child: child,
                    ),
                    child: Container(
                      width: constraints.maxWidth,
                      height: 5,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(42, 254, 187, 1),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(2),
                          bottomRight: Radius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: InkResponse(
                    onTap: () {
                      controller.animateTo(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            data.icon,
                            color: const Color.fromRGBO(5, 104, 89, 1),
                            size: 24,
                          ),
                          if (data.text != null) const SizedBox(height: 4),
                          if (data.text != null)
                            Text(
                              data.text!,
                              style: Paragraphs.disclaimer.copyWith(
                                fontSize: 10,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
