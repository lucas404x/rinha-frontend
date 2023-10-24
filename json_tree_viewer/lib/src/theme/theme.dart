import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/extensions/extensions.dart';
import 'colors.dart';

ThemeData createTheme() {
  final textTheme = GoogleFonts.interTextTheme();
  return ThemeData(
    pageTransitionsTheme: _NoTransitionsOnWeb(),
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
              return AppColors.button.darken(15);
            } else if (states.contains(MaterialState.hovered)) {
              return AppColors.button.darken(5);
            }
            return AppColors.button;
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
    colorScheme: const ColorScheme.light(
      error: AppColors.error,
      secondary: AppColors.accent,
    ),
    useMaterial3: true,
  );
}

final class _NoTransitionsOnWeb extends PageTransitionsTheme {
  @override
  Widget buildTransitions<T>(
    route,
    context,
    animation,
    secondaryAnimation,
    child,
  ) {
    if (kIsWeb) {
      return child;
    }
    return super.buildTransitions(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}