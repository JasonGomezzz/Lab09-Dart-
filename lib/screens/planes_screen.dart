import 'package:flutter/material.dart';
import '../data/peliculas.dart';
import '../theme/disney_theme.dart';

class PlanesScreen extends StatefulWidget {
  const PlanesScreen({super.key});

  @override
  State<PlanesScreen> createState() => _PlanesScreenState();
}

class _PlanesScreenState extends State<PlanesScreen> {
  int _elegido = 1;

  Future<void> _suscribirse() async {
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Demostración'),
        content: const Text(
            'Este es un proyecto académico: no se realiza ningún cobro ni se '
            'piden datos de pago. Inicia sesión para continuar.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('ACEPTAR')),
        ],
      ),
    );
    if (mounted) Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Elige tu plan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Cancela cuando quieras', style: tema.textTheme.bodyMedium),
          const SizedBox(height: 16),
          for (var i = 0; i < planes.length; i++)
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: i == _elegido ? DisneyColors.azulClaro : Colors.white12,
                  width: 2,
                ),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: Icon(
                  i == _elegido
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: DisneyColors.azulClaro,
                ),
                title: Text(planes[i]['nombre']!,
                    style: tema.textTheme.titleMedium),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text('${planes[i]['precio']}\n${planes[i]['detalle']}'),
                ),
                onTap: () => setState(() => _elegido = i),
              ),
            ),
          const SizedBox(height: 16),
          SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: _suscribirse,
              child: const Text('SUSCRIBIRME'),
            ),
          ),
        ],
      ),
    );
  }
}
