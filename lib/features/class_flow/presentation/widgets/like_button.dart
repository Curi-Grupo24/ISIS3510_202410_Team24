part of com.curi.app.classflow.widgets;

class LikeButton extends StatefulWidget {
  const LikeButton(
      {required this.onPressed, this.defaultFunction = true, Key? key,})
      : super(key: key);

  final Function(bool) onPressed;
  final bool defaultFunction;

  @override
  State<StatefulWidget> createState() => _LikeButton();
}

class _LikeButton extends State<LikeButton> {
  bool pressed = false;

  void onPressedIcon() {
    setState(() {
      pressed = !pressed;
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: pressed
          ? const Text('Añadido a tus favoritos')
          : const Text('Eliminado de tus favoritos'),
    ),);
    widget.onPressed(pressed);
  }

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: FloatingActionButton(
        backgroundColor: const Color(0x00FFFFFF),
        mini: true,
        onPressed: onPressedIcon,
        heroTag: null,
        child: pressed ? like : unlike,
      ),
    );
}
