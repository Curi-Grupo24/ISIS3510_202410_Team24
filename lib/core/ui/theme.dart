import 'package:flutter/material.dart' hide Colors;
import 'colors_brand.dart';
import 'constants.dart';
import 'layout.dart';
import 'typography.dart';

class UITheme {
  static final ThemeData curiThemeData = ThemeData(
    unselectedWidgetColor: Colors.gray[50],
    useMaterial3: false,
    disabledColor: Colors.gray[20],
    scaffoldBackgroundColor: Colors.gray[10],
    colorScheme: ColorScheme.light(
      primary: Colors.sunset[20]!,
      secondary: Colors.sunset[30]!,
      tertiary: Colors.sunset[50],
      onPrimary: Colors.sunset[20]!,
      onSecondary: Colors.white[0]!,
      onTertiary: Colors.white[0],
      primaryContainer: Colors.sunset[5],
      secondaryContainer: Colors.gray[20],
      onPrimaryContainer: Colors.sunset[20],
      background: Colors.gray[20]!,
      error: Colors.blooming[20]!,
      shadow: Colors.black[0],
      outline: Colors.gray[60],
      onSurface: Colors.gray[80]!,
      onSurfaceVariant: Colors.gray[40],
      inversePrimary: Colors.sunset[50],
      inverseSurface: Colors.gray[20],
      surfaceTint: Colors.sunset[5],
    ),
    textTheme: TextTheme(
      headlineLarge: Headings.h1.copyWith(color: Colors.gray[80]),
      headlineMedium: Headings.h2.copyWith(color: Colors.gray[80]),
      headlineSmall: Headings.h3.copyWith(color: Colors.gray[80]),
      titleLarge: Headings.h4.copyWith(color: Colors.gray[80]),
      titleMedium: Headings.h5.copyWith(color: Colors.gray[80]),
      titleSmall: Headings.h6.copyWith(color: Colors.gray[80]),
      bodyLarge: Paragraphs.large.copyWith(color: Colors.gray[80]),
      bodyMedium: Paragraphs.medium.copyWith(color: Colors.gray[80]),
      bodySmall: Paragraphs.small.copyWith(color: Colors.gray[80]),
      labelLarge: Headings.h4.copyWith(color: Colors.gray[80]),
      labelMedium: Headings.h7.copyWith(color: Colors.gray[80]),
      labelSmall: Headings.h8.copyWith(color: Colors.gray[80]),
      displayLarge: Paragraphs.small.copyWith(color: Colors.gray[80]),
      displayMedium: Paragraphs.small.copyWith(color: Colors.gray[80]),
      displaySmall: Paragraphs.disclaimer.copyWith(color: Colors.gray[80]),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.sunset[20],
      selectionColor: Colors.sunset[10],
      selectionHandleColor: Colors.sunset[20],
    ),
    iconTheme: IconThemeData(size: UILayout.large, color: Colors.sunset[20]),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: baseButtonStyle.copyWith(
        textStyle: MaterialStateProperty.all<TextStyle>(
          Headings.h7,
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.sunset[20]!.withOpacity(0.9);
            } else if (states.contains(MaterialState.disabled)) {
              return Colors.sunset[20]!.withOpacity(0.8);
            }
            return Colors.sunset[20]!;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.white[0]!.withOpacity(0.8);
            } else if (states.contains(MaterialState.disabled)) {
              return Colors.white[0]!.withOpacity(0.5);
            }
            return Colors.white[0]!;
          },
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: baseButtonStyle.copyWith(
        textStyle: MaterialStateProperty.all<TextStyle>(
          Headings.h7,
        ),
        backgroundColor: null,
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.gray[80]!.withOpacity(0.8);
            } else if (states.contains(MaterialState.disabled)) {
              return Colors.gray[60]!;
            }
            return Colors.gray[80]!;
          },
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: baseButtonStyle.copyWith(
        textStyle: MaterialStateProperty.all<TextStyle>(
          Headings.h7,
        ),
        side: MaterialStateProperty.all(BorderSide(color: Colors.gray[60]!)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.gray[30]!;
            } else if (states.contains(MaterialState.selected)) {
              return Colors.gray[40]!;
            } else if (states.contains(MaterialState.disabled)) {
              return Colors.transparent;
            }
            return Colors.transparent;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.gray[80]!.withOpacity(0.8);
            } else if (states.contains(MaterialState.disabled)) {
              return Colors.gray[60]!;
            }
            return Colors.gray[80]!;
          },
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      helperStyle: Paragraphs.disclaimer.copyWith(
        color: Colors.gray[80],
        letterSpacing: 0.5,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: border2.copyWith(
          color: Colors.sunset[20],
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: border2.copyWith(
          color: Colors.gray[60],
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: border2.copyWith(
          color: Colors.blooming[20],
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: border2.copyWith(
          color: Colors.blooming[20],
        ),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: border4.copyWith(
          color: Colors.gray[20],
        ),
      ),
      errorStyle: Paragraphs.disclaimer.copyWith(color: Colors.blooming[20]),
      filled: true,
    ),
    checkboxTheme: CheckboxThemeData(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(2),
        ),
      ),
      checkColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.sunset[20]!;
          } else if (states.contains(MaterialState.disabled)) {
            return Colors.sunset[10]!;
          }
          return Colors.white[0]!;
        },
      ),
      fillColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.sunset[20]!;
          } else if (states.contains(MaterialState.disabled)) {
            return Colors.sunset[5]!;
          }
          return Colors.sunset[20]!;
        },
      ),
      overlayColor: MaterialStateProperty.all(Colors.white[0]),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.sunset[30],
      elevation: 2,
      iconTheme: IconThemeData(
        color: Colors.white[0],
        size: 18,
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.white[0],
    ),
  );
}
