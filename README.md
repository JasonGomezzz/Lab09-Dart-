# streaming_app

Laboratorio de Desarrollo de Aplicaciones Móviles Multiplataforma (Flutter/Dart).
Réplica de la interfaz de **Disney+** (pantalla de inicio, catálogo y detalle) usando `ListView`, `ListTile`, `Card`, `Row` y `Column`.

## Conceptos aplicados

| Concepto | Dónde |
|---|---|
| ListView / ListTile | `lib/screens/disney_screen.dart` |
| Listas y mapas | `lib/data/peliculas.dart` |
| Rutas | `lib/main.dart` (`/`, `/disney`, `/detalle`) |
| Tema global | `lib/theme/disney_theme.dart` |
| Cards | `lib/widgets/poster_card.dart` y categorías/marcas |
| Row / Column / Stack | banners y secciones de ambas pantallas |
| 3 tipos de letra | Poppins (títulos), Roboto (cuerpo), Montserrat (botones) con `google_fonts` |
| Imágenes locales | `assets/images/logo.png`, `assets/images/banner.png` (`Image.asset`) |
| Imágenes en la nube | pósters con `Image.network` (Wikimedia) |

## Ejecutar

```bash
flutter pub get
flutter run
```

## Pruebas

```bash
flutter analyze
flutter test
```

`test/widget_test.dart` verifica que la pantalla de inicio navega a Disney+ y que el detalle muestra la sinopsis.

## Estructura

```
lib/
  main.dart      rutas y tema
  theme/         tema global por plataforma
  data/          listas y mapas de películas
  screens/       inicio, Disney+, detalle
  widgets/       PosterCard reutilizable
assets/images/   imágenes locales
```
