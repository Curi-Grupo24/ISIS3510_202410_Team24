part of com.curi.app.dashboard.widgets;

class DashboardTabBar extends StatefulWidget {
  const DashboardTabBar({
    required this.tabs,
    required this.controller,
    this.hasFab = false,
    Key? key,
  }) : super(key: key);
  final List<DashboardTabData> tabs;
  final bool? hasFab;
  final TabController controller;

  @override
  State<DashboardTabBar> createState() => _DashboardTabBarState();
}

class _DashboardTabBarState extends State<DashboardTabBar> {
  late int index;
  @override
  void initState() {
    index = 0;
    widget.controller.addListener(onIndexChanged);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(onIndexChanged);
    super.dispose();
  }

  void onIndexChanged() {
    index = widget.controller.index;
    setState(() {});
  }

  List<Widget> get tabs {
    final int currentIndex =4;
    final List<Widget> _tabs = widget.tabs.map((DashboardTabData tabData) => 
    DashboardTab(
        tabData,
        index: currentIndex,
        controller: widget.controller,
        isSelected: currentIndex == 1, 
      ),
  ).toList();
    if (widget.hasFab!) {
    _tabs.insert(0, const Spacer());
  }
  return _tabs;
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 64,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: tabs,
        ),
      );

      
}
