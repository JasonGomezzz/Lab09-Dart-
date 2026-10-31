# Disney+ (demo académica)

Laboratorio de Desarrollo de Aplicaciones Móviles Multiplataforma (Flutter/Dart).
Interfaz inspirada en Disney+: bienvenida, planes de suscripción, inicio de sesión,
catálogo con filtro por marca, buscador, descargas y perfil.

> Proyecto de demostración. No está afiliado a The Walt Disney Company, no usa el
> logotipo oficial (el logo es un texto) y no realiza cobros ni pide datos de pago.

## Conceptos aplicados

| Concepto | Dónde |
|---|---|
| ListView / ListTile | carruseles, "Continuar viendo", buscador, descargas y perfil (`lib/screens/tabs/`) |
| Listas y mapas | `lib/data/peliculas.dart` (`catalogo`, `categorias`, `planes`) |
| Rutas | `lib/main.dart`: `/`, `/login`, `/planes`, `/disney`, `/detalle` |
| Tema global | `lib/theme/disney_theme.dart` |
| Cards | `lib/widgets/poster_card.dart`, planes y marcas |
| Row / Column / Stack | hero del inicio, bienvenida y detalle |
| 3 tipos de letra | Poppins (títulos), Roboto (cuerpo), Montserrat (botones) con `google_fonts` |
| Imágenes locales | `assets/images/` (`banner.png`, `fondo.png`, `avatar.png`) con `Image.asset` |
| Imágenes en la nube | pósters con `Image.network` (Wikimedia) en `lib/widgets/imagen_nube.dart` |

## Funcionalidad

- **Bienvenida** con botones *Completar suscripción* e *Iniciar sesión*.
- **Planes**: tres Cards seleccionables y aviso de demostración.
- **Login**: formulario validado (correo con `@` y contraseña de 6+ caracteres).
- **Inicio**: película destacada, filtro por marca (Disney, Pixar, Marvel, Star Wars,
  Nat Geo) que muestra solo los títulos de esa marca, carruseles y "Continuar viendo".
- **Buscador**: filtra el catálogo por título, género, marca o año.
- **Descargas**, **Perfil** y **Detalle** de cada película.

## Ejecutar

```bash
flutter pub get
flutter run
```

Los pósters necesitan internet; si una imagen falla se reintenta automáticamente.

## Pruebas

```bash
flutter analyze
flutter test
```

`test/widget_test.dart` (7 pruebas) verifica la bienvenida, la validación del login,
el acceso al inicio, el flujo de suscripción, el filtro por marca (Marvel no muestra
películas de Pixar), el buscador y el detalle de una película.

## Estructura

```
lib/
  main.dart        rutas y tema
  theme/           tema global
  data/            listas y mapas del catálogo
  screens/         bienvenida, login, planes, principal, detalle
  screens/tabs/    inicio, buscar, descargas, perfil
  widgets/         PosterCard, ImagenNube, LogoDisney
assets/images/     imágenes locales
```
