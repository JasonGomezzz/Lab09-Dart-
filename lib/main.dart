import 'package:flutter/material.dart';
import 'screens/detalle_screen.dart';
import 'screens/disney_screen.dart';
import 'screens/inicio_screen.dart';
import 'theme/disney_theme.dart';

void main() => runApp(const StreamingApp());

class StreamingApp extends StatelessWidget {
  const StreamingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streaming App',
      debugShowCheckedModeBanner: false,
      theme: disneyTheme(),
      initialRoute: '/',
      routes: {
        '/': (_) => const InicioScreen(),
        '/disney': (_) => const DisneyScreen(),
        '/detalle': (_) => const DetalleScreen(),
      },
    );
  }
}
