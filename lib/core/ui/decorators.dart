import 'package:flutter/material.dart' hide Colors;

import 'colors_brand.dart';
import 'constants.dart';
import 'typography.dart';

class UIDecorator {
  static final UIDecorator instance = UIDecorator();
  final InputDecoration inputDecoration = InputDecoration(
    fillColor: Colors.gray[20],
    helperStyle: Paragraphs.disclaimer.copyWith(
      color: Colors.gray[80],
      letterSpacing: 0.5,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    border: inputBorder2,
    enabledBorder: inputBorder2,
    disabledBorder: inputBorder2,
    filled: true,
  );
}
