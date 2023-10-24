import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_tree_viewer/src/core/extensions/extensions.dart';

import '../core/helpers/no_transition_web.dart';

const _buttonColor = Color(0xFFE4E4E4);

ThemeData createTheme() {
  final textTheme = GoogleFonts.interTextTheme();
  return ThemeData(
    pageTransitionsTheme: NoTransitionsOnWeb(),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0))),
        side: const MaterialStatePropertyAll(BorderSide()),
        splashFactory: NoSplash.splashFactory,
        visualDensity: VisualDensity.compact,
        backgroundColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return _buttonColor.darken(15);
            } else if (states.contains(MaterialState.hovered)) {
              return _buttonColor.darken(5);
            }
            return _buttonColor;
          },
        ),
      ),
    ),
    textTheme: textTheme.copyWith(
      titleLarge: textTheme.titleLarge?.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 48,
      ),
      titleMedium: textTheme.titleMedium?.copyWith(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: textTheme.bodyMedium?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
    colorScheme: const ColorScheme.light(error: Color(0xFFBF0E0E), secondary: Color(0xFF4E9590)),
    useMaterial3: true,
  );
}
