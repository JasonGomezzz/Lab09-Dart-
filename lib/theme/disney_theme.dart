import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisneyColors {
  static const fondo = Color(0xFF040714);
  static const tarjeta = Color(0xFF1A1D29);
  static const azul = Color(0xFF0063E5);
  static const texto = Color(0xFFF9F9F9);
}

// Tres tipos de letra: Poppins (títulos), Roboto (cuerpo), Montserrat (botones).
ThemeData disneyTheme() {
  final base = ThemeData.dark();
  return base.copyWith(
    scaffoldBackgroundColor: DisneyColors.fondo,
    colorScheme: const ColorScheme.dark(
      primary: DisneyColors.azul,
      surface: DisneyColors.tarjeta,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: DisneyColors.fondo,
      elevation: 0,
      titleTextStyle: GoogleFonts.poppins(
          fontSize: 20, fontWeight: FontWeight.w600, color: DisneyColors.texto),
    ),
    cardTheme: CardThemeData(
      color: DisneyColors.tarjeta,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    textTheme: TextTheme(
      headlineSmall:
          GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
      titleMedium:
          GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
      bodyMedium: GoogleFonts.roboto(fontSize: 14, color: Colors.white70),
      labelLarge: GoogleFonts.montserrat(
          fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 1.2),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DisneyColors.azul,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700, letterSpacing: 1.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
  );
}
