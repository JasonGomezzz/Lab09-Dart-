import 'package:flutter/material.dart';
import 'screens/bienvenida_screen.dart';
import 'screens/detalle_screen.dart';
import 'screens/login_screen.dart';
import 'screens/planes_screen.dart';
import 'screens/principal_screen.dart';
import 'theme/disney_theme.dart';

void main() => runApp(const StreamingApp());

class StreamingApp extends StatelessWidget {
  const StreamingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disney+ (demo académica)',
      debugShowCheckedModeBanner: false,
      theme: disneyTheme(),
      initialRoute: '/',
      routes: {
        '/': (_) => const BienvenidaScreen(),
        '/login': (_) => const LoginScreen(),
        '/planes': (_) => const PlanesScreen(),
        '/disney': (_) => const PrincipalScreen(),
        '/detalle': (_) => const DetalleScreen(),
      },
    );
  }
}
