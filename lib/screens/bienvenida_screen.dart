import 'package:flutter/material.dart';
import '../widgets/logo_disney.dart';

class BienvenidaScreen extends StatelessWidget {
  const BienvenidaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fondo con imagen local
          Image.asset('assets/images/fondo.png', fit: BoxFit.cover),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 48),
                  const LogoDisney(tamano: 52),
                  const SizedBox(height: 28),
                  Text('¡Tus películas, series y documentales favoritos!',
                      style: tema.textTheme.headlineSmall
                          ?.copyWith(fontSize: 30, height: 1.2)),
                  const SizedBox(height: 16),
                  Text(
                    'Disney+ ofrece el mejor entretenimiento con películas y '
                    'series de Disney, Pixar, Marvel, Star Wars y National '
                    'Geographic.',
                    style: tema.textTheme.bodyMedium?.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/planes'),
                      child: const Text('COMPLETAR SUSCRIPCIÓN'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white54),
                        shape: const StadiumBorder(),
                        textStyle: tema.textTheme.labelLarge,
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                      child: const Text('INICIAR SESIÓN'),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Proyecto académico de demostración. No está afiliado a '
                    'The Walt Disney Company; no se realizan cobros reales.',
                    style: tema.textTheme.bodyMedium
                        ?.copyWith(fontSize: 12, color: Colors.white54),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
