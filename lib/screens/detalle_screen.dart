import 'package:flutter/material.dart';

class DetalleScreen extends StatelessWidget {
  const DetalleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final p =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final tema = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(p['titulo']!)),
      body: ListView(
        children: [
          SizedBox(
            height: 420,
            child: Image.network(p['imagen']!,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) =>
                    const Center(child: Icon(Icons.movie, size: 64))),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(p['titulo']!, style: tema.textTheme.headlineSmall),
                const SizedBox(height: 4),
                Text('${p['anio']} · ${p['genero']} · ${p['duracion']}',
                    style: tema.textTheme.bodyMedium),
                const SizedBox(height: 16),
                Row(children: [
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('REPRODUCIR')),
                  const SizedBox(width: 12),
                  const Icon(Icons.add_circle_outline, size: 32),
                ]),
                const SizedBox(height: 16),
                Text(p['sinopsis']!, style: tema.textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
