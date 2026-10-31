import 'package:flutter/material.dart';
import 'imagen_nube.dart';

class PosterCard extends StatelessWidget {
  final Map<String, String> pelicula;
  const PosterCard({super.key, required this.pelicula});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, '/detalle', arguments: pelicula),
      child: SizedBox(
        width: 130,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ImagenNube(pelicula['imagen']!, width: double.infinity),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(pelicula['titulo']!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
