import 'package:flutter/material.dart';

const MaterialColor primarySwath = Colors.green;

class CustomThemeData {
  static ThemeData themeData = ThemeData(
    primarySwatch: primarySwath,
    textTheme:  TextTheme(
      titleSmall: const TextStyle(
        color: Color.fromARGB(255, 68, 68, 68),
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.2,        
      ),
      titleMedium:  TextStyle(
        color: Colors.green.shade800,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
        fontStyle: FontStyle.normal,
      ),
      titleLarge:  TextStyle(
        color: Colors.red.shade400,
        fontSize: 28.0,
        fontWeight: FontWeight.w600,
      ),
      labelLarge:  const TextStyle(
        color: Colors.white,
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
