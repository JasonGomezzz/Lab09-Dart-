import 'package:flutter/material.dart';

// Imagen de la nube con User-Agent propio y reintentos: Wikimedia limita las
// descargas simultáneas (HTTP 429), así que si falla se vuelve a pedir.
class ImagenNube extends StatefulWidget {
  final String url;
  final double? width;
  final double? height;
  /// Número de reintentos ante un error de red (los tests lo ponen en 0).
  static int maxIntentos = 8;

  const ImagenNube(this.url, {super.key, this.width, this.height});

  @override
  State<ImagenNube> createState() => _ImagenNubeState();
}

class _ImagenNubeState extends State<ImagenNube> {
  int _intento = 0;

  void _reintentar() {
    if (_intento >= ImagenNube.maxIntentos) return;
    Future.delayed(Duration(seconds: 1 + _intento), () {
      if (mounted) setState(() => _intento++);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.url,
      key: ValueKey(_intento),
      width: widget.width,
      height: widget.height,
      fit: BoxFit.cover,
      headers: const {'User-Agent': 'streaming_app/1.0 (laboratorio Flutter)'},
      loadingBuilder: (c, child, p) =>
          p == null ? child : const Center(child: CircularProgressIndicator()),
      errorBuilder: (c, e, s) {
        _reintentar();
        return const Center(child: Icon(Icons.movie));
      },
    );
  }
}
