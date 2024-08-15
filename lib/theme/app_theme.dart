import 'package:flutter/material.dart';

class AppTheme {
  // Updated Anthropomorphic Colors
  static const Color warmColor = Color(0xFFFFCC80); // Peach Orange
  static const Color calmColor = Color(0xFFB3E5FC); // Pale Blue
  static const Color energyColor = Color(0xFFFF7043); // Coral
  static const Color trustColor = Color(0xFF4A90E2); // Cerulean Blue
  static const Color elegantColor = Color(0xFF9E9E9E); // Warm Gray
  static const Color creativeColor = Color(0xFFAB47BC); // Soft Lavender

  static ThemeData lightTheme = ThemeData(
    primaryColor: trustColor,
    hintColor: energyColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: trustColor,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.black,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Colors.black87,
        fontSize: 16,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: energyColor,
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: energyColor,
    ),
    iconTheme: const IconThemeData(
      color: creativeColor,
    ),
    colorScheme: const ColorScheme.light(
      primary: trustColor,
      secondary: warmColor,
      surface: elegantColor,
      background: calmColor,
      error: Colors.redAccent,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black87,
      onBackground: Colors.black87,
      onError: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: elegantColor,
    hintColor: warmColor,
    scaffoldBackgroundColor: const Color(0xFF121212),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF1E1E1E), // Darker tone for AppBar
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Colors.white70,
        fontSize: 16,
      ),
      labelLarge: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: creativeColor,
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: energyColor,
    ),
    iconTheme: const IconThemeData(
      color: energyColor,
    ),
    colorScheme: const ColorScheme.dark(
      primary: trustColor,
      secondary: energyColor,
      surface: creativeColor,
      background: Color(0xFF1E1E1E), // Dark background
      error: Colors.redAccent,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.black,
    ),
  );
}
