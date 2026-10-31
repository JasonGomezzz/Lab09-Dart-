import 'package:flutter/material.dart';
import '../../data/peliculas.dart';
import '../../theme/disney_theme.dart';
import '../../widgets/imagen_nube.dart';
import '../../widgets/poster_card.dart';

class InicioTab extends StatefulWidget {
  const InicioTab({super.key});

  @override
  State<InicioTab> createState() => _InicioTabState();
}

class _InicioTabState extends State<InicioTab> {
  String? _marca; // null = todo el catálogo

  void _abrir(Map<String, String> p) =>
      Navigator.pushNamed(context, '/detalle', arguments: p);

  Widget _titulo(String texto, {Widget? accion}) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 22, 16, 8),
        child: Row(
          children: [
            Expanded(
                child:
                    Text(texto, style: Theme.of(context).textTheme.titleMedium)),
            ?accion,
          ],
        ),
      );

  Widget _carrusel(String titulo, List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titulo(titulo),
        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(width: 10),
            itemBuilder: (_, i) => PosterCard(pelicula: items[i]),
          ),
        ),
      ],
    );
  }

  Widget _hero(Map<String, String> p) {
    final tema = Theme.of(context);
    return Stack(
      children: [
        Image.asset('assets/images/banner.png',
            width: double.infinity, height: 260, fit: BoxFit.cover),
        Container(
          height: 260,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, DisneyColors.fondo],
            ),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 12,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                    width: 110,
                    height: 165,
                    child: ImagenNube(p['imagen']!)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(p['titulo']!, style: tema.textTheme.headlineSmall),
                    const SizedBox(height: 4),
                    Text('${p['anio']} · ${p['genero']} · ${p['duracion']}',
                        style: tema.textTheme.bodyMedium),
                    const SizedBox(height: 10),
                    Wrap(spacing: 8, children: [
                      ElevatedButton.icon(
                        onPressed: () => _abrir(p),
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('VER'),
                      ),
                      IconButton.outlined(
                          onPressed: () {}, icon: const Icon(Icons.add)),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _marcas() {
    final tema = Theme.of(context);
    return SizedBox(
      height: 84,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16),
        itemCount: categorias.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (_, i) {
          final nombre = categorias[i]['nombre']!;
          final activa = _marca == nombre;
          return GestureDetector(
            onTap: () => setState(() => _marca = activa ? null : nombre),
            child: Container(
              width: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(int.parse(categorias[i]['color']!)),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: activa ? Colors.white : Colors.white24,
                    width: activa ? 2.5 : 1),
              ),
              child: Text(nombre.toUpperCase(),
                  style: tema.textTheme.labelLarge),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final filtradas = _marca == null ? <Map<String, String>>[] : porMarca(_marca!);
    final destacada = _marca == null ? novedades.first : filtradas.first;

    return ListView(
      children: [
        _hero(destacada),
        _marcas(),
        if (_marca == null) ...[
          _carrusel('Novedades en Disney+', novedades),
          _carrusel('Recomendadas para ti', recomendadas),
          _titulo('Continuar viendo'),
          ...continuarViendo.map((p) => ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: SizedBox(
                      width: 48, height: 72, child: ImagenNube(p['imagen']!)),
                ),
                title: Text(p['titulo']!),
                subtitle: Text(p['progreso']!),
                trailing: const Icon(Icons.play_circle_outline),
                onTap: () => _abrir(p),
              )),
        ] else ...[
          _titulo(
            '$_marca · ${filtradas.length} títulos',
            accion: TextButton(
              onPressed: () => setState(() => _marca = null),
              child: Text('VER TODO', style: tema.textTheme.labelLarge),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            childAspectRatio: 0.55,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: filtradas
                .map((p) => PosterCard(pelicula: p, ancho: null))
                .toList(),
          ),
        ],
        const SizedBox(height: 24),
      ],
    );
  }
}
