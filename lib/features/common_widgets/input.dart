part of com.curi.app.commonwidgets.widgets;

class Input extends StatefulWidget {
  const Input({
    @required this.controller,
    Key? key,
    this.error,
    this.icon,
    this.node,
    this.enabled = true,
    this.autofocus = false,
    this.isPassword = false,
    this.onChange,
    this.onSubmitted,
    this.formatters,
    this.action,
    this.keyboardType,
    this.suffix,
    this.textInputFormatterType = TextInputFormatterType.none,
    this.maxLength,
    this.readOnly = false,
    this.prefill = false,
    this.capitalization = TextCapitalization.none,
    this.enableInteractiveSelection = true,
    this.maxLines = 1,
    this.hintText,
  }) : super(key: key);

  final String? error;
  final IconData? icon;
  final Widget? suffix;
  final FocusNode? node;
  final TextEditingController? controller;
  final bool? enabled;
  final bool? autofocus;
  final bool? isPassword;
  final void Function(String)? onChange;
  final void Function(String)? onSubmitted;
  final List<TextInputFormatter>? formatters;
  final TextInputAction? action;
  final TextInputType? keyboardType;
  final TextInputFormatterType? textInputFormatterType;
  final int? maxLength;
  final bool? readOnly;
  final bool? prefill;
  final TextCapitalization? capitalization;
  final bool enableInteractiveSelection;
  final int maxLines;
  final String? hintText;

  @override
  InputState createState() => InputState();
}

class InputState extends State<Input> {
  OverlayEntry? overlayEntry;
  FocusNode? focusNode;
  void Function(String)? onSubmitted;

  bool shouldShowOverlay = false;
  bool isFocused = false;
  DateTime dateTime = DateTime.now();

  Color get decorationColor {
    if (widget.error != null && widget.error!.isNotEmpty) {
      return Colors.blooming[20]!;
    }
    if (isFocused) {
      return Colors.gray[90]!;
    }
    if (!widget.enabled!) {
      return Colors.gray[90]!;
    } else {
      return Colors.gray[90]!;
    }
  }

  Color get decorationTextColor {
    if (!widget.enabled!) {
      return Colors.gray[40]!;
    } else {
      return Colors.gray[80]!;
    }
  }

  Color get decorationIconColor {
    if (!widget.enabled!) {
      return Colors.gray[40]!;
    } else {
      return Colors.gray[60]!;
    }
  }

  @override
  void dispose() {
    if (widget.node == null) {
      focusNode?.dispose();
    }
    if (focusNode != null) {
      focusNode!.removeListener(() {});
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    focusNode = widget.node ?? FocusNode();
    onSubmitted = widget.onSubmitted ??
        (String _) {
          focusNode?.unfocus();
        };

    if (Platform.isIOS &&
        widget.keyboardType != null &&
        (widget.keyboardType == TextInputType.phone ||
            widget.keyboardType == TextInputType.number)) {
      shouldShowOverlay = true;
    }
    focusListener();
  }

  Future<void> focusListener() async {
    if (!mounted) {
      return;
    }
    if (shouldShowOverlay) {
      await Future<void>.delayed(const Duration(milliseconds: 200));
    }
    focusNode!
      ..removeListener(() {})
      ..addListener(() {
        FocusNode? focused;
        if (mounted) {
          focused = FocusScope.of(context).focusedChild;
        }
        if (focusNode!.hasFocus &&
            focused != null &&
            widget.node != null &&
            focused == widget.node) {
          isFocused = true;
          if (shouldShowOverlay) {
            // showOverlay(context);
          }
        } else {
          isFocused = false;
          if (shouldShowOverlay) {
            removeOverlay();
          }
        }
        if (mounted) {
          setState(() {});
        }
      });
  }

  InputDecoration getDecorator(
    BuildContext context, {
    String? hintText,
  }) =>
      UIDecorator.instance.inputDecoration.copyWith(
        counterText: '',
        fillColor: Colors.white[0],
        disabledBorder: UnderlineInputBorder(
          borderSide: border1.copyWith(
            color: decorationColor,
          ),
        ),
        hintText: hintText,
        labelStyle: Paragraphs.medium.copyWith(
            color: decorationTextColor,
            decoration: TextDecoration.none,
          ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        enabledBorder: UnderlineInputBorder(
          borderSide: border1.copyWith(
            color: widget.prefill!
                ? Theme.of(context).colorScheme.secondary
                : decorationColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: border1.copyWith(
            color: decorationColor,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: border1.copyWith(
            color: decorationColor,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: border1.copyWith(
            color: decorationColor,
          ),
        ),
        errorText: widget.error,
        errorStyle: Paragraphs.disclaimer.copyWith(color: Colors.blooming[20]),
        errorMaxLines: 2,
        prefixIcon: widget.icon != null
            ? Icon(widget.icon, color: decorationIconColor)
            : null,
        suffixIcon: widget.suffix,
        
      );

  void removeOverlay() {
    if (overlayEntry != null) {
      overlayEntry!.remove();
      overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context) => AbsorbPointer(
        absorbing: !widget.enabled!,
        child: TextField(
          maxLength: widget.maxLength,
          cursorColor: Colors.gray[70],
          textCapitalization: widget.capitalization!,
          readOnly: widget.readOnly!
              ? widget.readOnly!
              : widget.keyboardType == TextInputType.datetime,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          keyboardAppearance: Platform.isAndroid
              ? Brightness.dark
              : CupertinoTheme.brightnessOf(context),
          focusNode: widget.node,
          controller: widget.controller,
          enabled: true,
          autofocus: widget.autofocus!,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword!,
          textInputAction: widget.action,
          inputFormatters: <TextInputFormatter>[
            ...widget.formatters ?? <TextInputFormatter>[],
            if ((widget.textInputFormatterType ==
                        TextInputFormatterType.money ||
                    widget.textInputFormatterType ==
                        TextInputFormatterType.creditCart) &&
                widget.keyboardType == TextInputType.number)
              LengthLimitingTextInputFormatter(widget.maxLength ?? 11),
          ],
          onChanged: widget.onChange,
          onSubmitted: onSubmitted,
          style: Paragraphs.medium.copyWith(
            color: decorationTextColor,
            decoration: TextDecoration.none,
          ),
          decoration: getDecorator(context, hintText: widget.hintText),
          maxLines: widget.maxLines,
        ),
      );
}
