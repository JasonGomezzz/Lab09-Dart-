import 'package:flutter/material.dart';
import '../data/peliculas.dart';
import '../theme/disney_theme.dart';
import '../widgets/poster_card.dart';

class DisneyScreen extends StatelessWidget {
  const DisneyScreen({super.key});

  void _abrir(BuildContext context, Map<String, String> p) =>
      Navigator.pushNamed(context, '/detalle', arguments: p);

  Widget _titulo(BuildContext context, String texto) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 22, 16, 8),
        child: Text(texto, style: Theme.of(context).textTheme.titleMedium),
      );

  Widget _carrusel(BuildContext context, String titulo,
      List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titulo(context, titulo),
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

  Widget _hero(BuildContext context, Map<String, String> p) {
    final tema = Theme.of(context);
    return Stack(
      children: [
        // Fondo con imagen local
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
                  child: Image.network(p['imagen']!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) =>
                          const Center(child: Icon(Icons.movie))),
                ),
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
                        onPressed: () => _abrir(context, p),
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('VER'),
                      ),
                      IconButton.outlined(
                          onPressed: () {},
                          icon: const Icon(Icons.add)),
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

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png', height: 32),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: DisneyColors.fondo,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        onTap: (i) {
          if (i != 0) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Próximamente')));
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.download), label: 'Descargas'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
      body: ListView(
        children: [
          _hero(context, novedades.first),
          // Marcas (lista de mapas en carrusel horizontal)
          SizedBox(
            height: 84,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(16),
              itemCount: categorias.length,
              separatorBuilder: (_, _) => const SizedBox(width: 10),
              itemBuilder: (_, i) => Container(
                width: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(int.parse(categorias[i]['color']!)),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white24),
                ),
                child: Text(categorias[i]['nombre']!,
                    style: tema.textTheme.labelLarge),
              ),
            ),
          ),
          _carrusel(context, 'Novedades en Disney+', novedades),
          _carrusel(context, 'Recomendadas para ti', recomendadas),
          _titulo(context, 'Continuar viendo'),
          ...continuarViendo.map((p) => ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: SizedBox(
                    width: 48,
                    height: 72,
                    child: Image.network(p['imagen']!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) =>
                            const Center(child: Icon(Icons.movie))),
                  ),
                ),
                title: Text(p['titulo']!),
                subtitle: Text(p['progreso']!),
                trailing: const Icon(Icons.play_circle_outline),
                onTap: () => _abrir(context, p),
              )),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
