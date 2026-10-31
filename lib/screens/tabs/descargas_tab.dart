import 'package:flutter/material.dart';
import '../../data/peliculas.dart';
import '../../widgets/imagen_nube.dart';

class DescargasTab extends StatelessWidget {
  const DescargasTab({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Disponibles sin conexión',
              style: tema.textTheme.titleMedium),
        ),
        ...continuarViendo.map((p) => ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: SizedBox(
                    width: 48, height: 72, child: ImagenNube(p['imagen']!)),
              ),
              title: Text(p['titulo']!),
              subtitle: Text('${p['duracion']} · Descargada'),
              trailing: const Icon(Icons.download_done, color: Colors.green),
              onTap: () =>
                  Navigator.pushNamed(context, '/detalle', arguments: p),
            )),
      ],
    );
  }
}
