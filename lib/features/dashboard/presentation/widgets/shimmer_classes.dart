part of com.curi.app.dashboard.widgets;

class ShimmerDashboardClasses extends StatelessWidget {
  const ShimmerDashboardClasses({
    super.key,
  });

  @override
  Widget build(BuildContext context) => DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.gray[20],
      ),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: <Widget>[
                Shimmer.fromColors(
                  baseColor: Colors.gray[40]!,
                  highlightColor: Colors.white[0]!,
                  child: ColoredBox(
                    color: Colors.white[0]!,
                    child: const SizedBox(
                      width: 150,
                      height: 195,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.gray[40]!,
                  highlightColor: Colors.white[0]!,
                  child: ColoredBox(
                    color: Colors.white[0]!,
                    child: const SizedBox(
                      width: 150,
                      height: 195,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
}
