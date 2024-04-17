import 'dart:ui';

class Colors {
  static const Map<int, Color> sunset = <int, Color>{
    5: Color.fromRGBO(255, 239, 187, 1),
    10: Color.fromRGBO(255, 220, 103, 1),
    20: Color.fromRGBO(255, 207, 45, 1),
    30: Color.fromRGBO(242, 177, 44, 1),
    40: Color.fromRGBO(243, 150, 46, 1),
    50: Color.fromRGBO(246, 139, 19, 1),
    60: Color.fromRGBO(229, 123, 5, 1),
    70: Color.fromRGBO(205, 108, 0, 1),
  };

  static const Map<int, Color> jelly = <int, Color>{
    10: Color.fromRGBO(178, 98, 156, 1),
    20: Color.fromRGBO(133, 114, 255, 1),
    40: Color.fromRGBO(115, 33, 92, 1),
  };

  static const Map<int, Color> ocean = <int, Color>{
    5: Color.fromRGBO(175, 234, 233, 1),
    40: Color.fromRGBO(41, 183, 180, 1),
    50: Color.fromRGBO(25, 154, 152, 1),
  };

  static const Map<int, Color> blooming = <int, Color>{
    0: Color.fromRGBO(255, 221, 221, 1),
    5: Color.fromRGBO(255, 182, 182, 1),
    10: Color.fromRGBO(255, 108, 108, 1),
    20: Color.fromRGBO(255, 70, 70, 1),
    30: Color.fromRGBO(208, 29, 29, 1),
    40: Color.fromRGBO(172, 13, 13, 1),
    50: Color.fromRGBO(143, 8, 8, 1),
  };
  static const Map<int, Color> gray = <int, Color>{
    0: Color.fromRGBO(255, 255, 255, 1),
    10: Color.fromRGBO(251, 252, 253, 1),
    20: Color.fromRGBO(245, 248, 250, 1),
    30: Color.fromRGBO(239, 243, 249, 1),
    40: Color.fromRGBO(221, 224, 232, 1),
    50: Color.fromRGBO(184, 187, 191, 1),
    60: Color.fromRGBO(122, 147, 171, 1),
    70: Color.fromRGBO(74, 74, 74, 1),
    80: Color.fromRGBO(44, 67, 89, 1),
    90: Color.fromRGBO(26, 28, 33, 1),
  };

  static const Map<int, Color> neutralGray = <int, Color>{
    0: Color.fromRGBO(231, 231, 231, 1),
    10: Color.fromRGBO(208, 208, 208, 1),
    20: Color.fromRGBO(184, 184, 184, 1),
    30: Color.fromRGBO(160, 160, 160, 1),
    40: Color.fromRGBO(137, 137, 137, 1),
    50: Color.fromRGBO(113, 113, 113, 1),
    60: Color.fromRGBO(89, 89, 89, 1),
    70: Color.fromRGBO(65, 65, 65, 1),
    80: Color.fromRGBO(42, 42, 42, 1),
    90: Color.fromRGBO(18, 18, 18, 1),
  };
  static const Map<int, Color> white = <int, Color>{
    0: Color.fromRGBO(255, 255, 255, 1),
  };
  static const Map<int, Color> black = <int, Color>{
    0: Color.fromRGBO(0, 0, 0, 1),
  };
  static const Color transparent = Color.fromRGBO(255, 255, 255, 0);
}
