import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: Color(0xFF192BC2),
    scaffoldBackgroundColor: Colors.grey[200],
    brightness: Brightness.light,
    cardColor: Colors.white,
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: const AppBarTheme(
        elevation: 2,
        backgroundColor: Color(0xFF192BC2),
        foregroundColor: Colors.white,
        shadowColor: Colors.grey,
        iconTheme: IconThemeData(
          color: Colors.black45,
        )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFF192BC2),
      unselectedItemColor: Colors.grey,
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xFF192BC2),
        primary: Color(0xFF192BC2),
        surface: Colors.white,
        brightness: Brightness.light),
    cardTheme: CardTheme(
      color: Colors.grey[100],
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(12),
    ),
  );
  static final darkTheme = ThemeData(
    primaryColor: Color(0xFF192BC2),
    scaffoldBackgroundColor: Color(0xFF121212),
    brightness: Brightness.dark,
    textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme),
    cardColor: Color(0xFF192BC2),
    appBarTheme: const AppBarTheme(
      elevation: 2,
      backgroundColor: Color(0xFF101B72),
      foregroundColor: Colors.white,
      shadowColor: Colors.grey,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: Color(0xFF192BC2),
      unselectedItemColor: Colors.grey,
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.black45,
        primary: Color(0xFF192BC2),
        surface: const Color(0xFF121212),
        brightness: Brightness.dark),
    cardTheme: CardTheme(
      color: Colors.grey[900],
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(12),
    ),
  );
}
