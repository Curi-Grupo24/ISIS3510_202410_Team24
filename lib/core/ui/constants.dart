library com.curi.app.ui.constants;

import 'package:flutter/material.dart' hide Colors;
import 'colors_brand.dart';
import 'layout.dart';

enum ScreenType {
  MOBILE,
}

/// [+boders]
const BorderSide border1 = BorderSide(width: 1);
const BorderSide border2 = BorderSide(width: 2);
const BorderSide border4 = BorderSide(width: 4);

final InputBorder inputBorder4 = UnderlineInputBorder(
  borderSide: border4.copyWith(
    color: Colors.gray[60],
  ),
);

final InputBorder inputBorder2 = UnderlineInputBorder(
  borderSide: border2.copyWith(
    color: Colors.gray[60],
  ),
);

final Border inputPrefixBorder2 = Border(
  bottom: border2.copyWith(
    color: Colors.gray[60],
  ),
);

/// [+border-radius]
final BorderRadius radius2 = BorderRadius.circular(2);
final BorderRadius radius4 = BorderRadius.circular(4);
final BorderRadius radius8 = BorderRadius.circular(8);
final BorderRadius radius12 = BorderRadius.circular(12);
final BorderRadius radius16 = BorderRadius.circular(16);
final BorderRadius radius24 = BorderRadius.circular(24);
final BorderRadius radius32 = BorderRadius.circular(32);

const BorderRadius radiust4 = BorderRadius.only(
  topLeft: Radius.circular(4),
  topRight: Radius.circular(4),
);
const BorderRadius radiusl4 = BorderRadius.only(
  topLeft: Radius.circular(4),
  bottomLeft: Radius.circular(4),
);
const BorderRadius radiusr4 = BorderRadius.only(
  topRight: Radius.circular(4),
  bottomRight: Radius.circular(4),
);
const BorderRadius radiusb4 = BorderRadius.only(
  bottomLeft: Radius.circular(4),
  bottomRight: Radius.circular(4),
);
const BorderRadius radiusb10 = BorderRadius.only(
  bottomLeft: Radius.circular(10),
  bottomRight: Radius.circular(10),
);
const BorderRadius radiusl8 = BorderRadius.only(
  topLeft: Radius.circular(8),
  bottomLeft: Radius.circular(8),
);
const BorderRadius radiusr8 = BorderRadius.only(
  topRight: Radius.circular(8),
  bottomRight: Radius.circular(8),
);

const BoxShadow shadowB8 = BoxShadow(
  color: Color(0x0f000000), // color-name
  offset: Offset(0, 0),
  blurRadius: 8,
  spreadRadius: 0,
);

/// [+box-shadow]
const BoxShadow shadowB16 = BoxShadow(
  color: Color(0x0f000000), // color-name
  offset: Offset(0, 8),
  blurRadius: 16,
  spreadRadius: 0,
);

const BoxShadow shadowO4B8 = BoxShadow(
  color: Color(0x0f000000), // color-name
  offset: Offset(0, 4),
  blurRadius: 8,
  spreadRadius: 0,
);

const BoxShadow shadowB4 = BoxShadow(
  color: Color(0x0f000000), // color-name
  offset: Offset(0, 2),
  blurRadius: 4,
  spreadRadius: 0,
);

const BoxShadow shadowB2 = BoxShadow(
  color: Color(0x0f000000), // color-name
  offset: Offset(0, 1),
  blurRadius: 2,
  spreadRadius: 0,
);

BoxShadow customShadow({double? x, double? y, double? b, double? s}) =>
    BoxShadow(
      color: const Color(0x0f000000), // color-name
      offset: Offset(x!, y!),
      blurRadius: b!,
      spreadRadius: s!,
    );

Widget get loading => Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white[0]!),
      ),
    );

/// [buttons-styles]
ButtonStyle get baseButtonStyle => ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(
          horizontal: UILayout.medium,
          vertical: UILayout.medium,
        ),
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: radius4,
        ),
      ),
      side: null,
      elevation: MaterialStateProperty.all<double>(0),
    );
