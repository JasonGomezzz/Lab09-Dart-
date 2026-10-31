import 'package:flutter/material.dart';
import '../../data/peliculas.dart';
import '../../widgets/imagen_nube.dart';

class BuscarTab extends StatefulWidget {
  const BuscarTab({super.key});

  @override
  State<BuscarTab> createState() => _BuscarTabState();
}

class _BuscarTabState extends State<BuscarTab> {
  String _consulta = '';

  List<Map<String, String>> get _resultados {
    final q = _consulta.trim().toLowerCase();
    if (q.isEmpty) return catalogo;
    return catalogo.where((p) {
      return [p['titulo'], p['genero'], p['marca'], p['anio']]
          .any((campo) => campo!.toLowerCase().contains(q));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final resultados = _resultados;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            onChanged: (v) => setState(() => _consulta = v),
            decoration: const InputDecoration(
              hintText: 'Películas, géneros, marcas…',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              _consulta.isEmpty
                  ? 'Todo el catálogo (${resultados.length})'
                  : '${resultados.length} resultados',
              style: tema.textTheme.bodyMedium,
            ),
          ),
        ),
        Expanded(
          child: resultados.isEmpty
              ? Center(
                  child: Text('Sin resultados para "$_consulta"',
                      style: tema.textTheme.bodyMedium))
              : ListView.builder(
                  itemCount: resultados.length,
                  itemBuilder: (_, i) {
                    final p = resultados[i];
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: SizedBox(
                            width: 48,
                            height: 72,
                            child: ImagenNube(p['imagen']!)),
                      ),
                      title: Text(p['titulo']!),
                      subtitle:
                          Text('${p['marca']} · ${p['genero']} · ${p['anio']}'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => Navigator.pushNamed(context, '/detalle',
                          arguments: p),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
