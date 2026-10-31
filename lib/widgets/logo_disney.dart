import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/disney_theme.dart';

/// Logotipo de texto (no se usa el logo oficial por derechos de autor).
class LogoDisney extends StatelessWidget {
  final double tamano;
  const LogoDisney({super.key, this.tamano = 28});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Disney',
        style: GoogleFonts.poppins(
          fontSize: tamano,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
          letterSpacing: -0.5,
          color: Colors.white,
        ),
        children: [
          TextSpan(
            text: '+',
            style: TextStyle(color: DisneyColors.azulClaro),
          ),
        ],
      ),
    );
  }
}
