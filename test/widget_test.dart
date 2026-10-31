import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:streaming_app/main.dart';
import 'package:streaming_app/widgets/imagen_nube.dart';

Future<void> iniciarSesion(WidgetTester tester) async {
  await tester.pumpWidget(const StreamingApp());
  await tester.tap(find.text('INICIAR SESIÓN'));
  await tester.pumpAndSettle();
  await tester.enterText(
      find.widgetWithText(TextFormField, 'Correo electrónico'), 'a@b.com');
  await tester.enterText(
      find.widgetWithText(TextFormField, 'Contraseña'), '123456');
  await tester.tap(find.widgetWithText(ElevatedButton, 'INICIAR SESIÓN'));
  await tester.pumpAndSettle();
}

void main() {
  // Sin red en los tests: evita reintentos con temporizadores pendientes.
  setUp(() => ImagenNube.maxIntentos = 0);

  testWidgets('Bienvenida ofrece suscripción e inicio de sesión',
      (tester) async {
    await tester.pumpWidget(const StreamingApp());
    expect(find.text('COMPLETAR SUSCRIPCIÓN'), findsOneWidget);
    expect(find.text('INICIAR SESIÓN'), findsOneWidget);
  });

  testWidgets('Login valida los campos antes de entrar', (tester) async {
    await tester.pumpWidget(const StreamingApp());
    await tester.tap(find.text('INICIAR SESIÓN'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(ElevatedButton, 'INICIAR SESIÓN'));
    await tester.pumpAndSettle();
    expect(find.text('Ingresa un correo válido'), findsOneWidget);
    expect(find.text('Mínimo 6 caracteres'), findsOneWidget);
  });

  testWidgets('Login correcto lleva al inicio de Disney+', (tester) async {
    await iniciarSesion(tester);
    expect(find.text('Novedades en Disney+'), findsOneWidget);
  });

  testWidgets('Planes: suscribirse muestra aviso y lleva al login',
      (tester) async {
    await tester.pumpWidget(const StreamingApp());
    await tester.tap(find.text('COMPLETAR SUSCRIPCIÓN'));
    await tester.pumpAndSettle();
    expect(find.text('Premium'), findsOneWidget);
    await tester.tap(find.text('SUSCRIBIRME'));
    await tester.pumpAndSettle();
    expect(find.text('Demostración'), findsOneWidget);
    await tester.tap(find.text('ACEPTAR'));
    await tester.pumpAndSettle();
    expect(find.text('Inicia sesión'), findsOneWidget);
  });

  testWidgets('Marvel filtra el catálogo solo a películas de Marvel',
      (tester) async {
    await iniciarSesion(tester);
    await tester.tap(find.text('MARVEL'));
    await tester.pumpAndSettle();
    expect(find.text('Marvel · 7 títulos'), findsOneWidget);
    expect(find.text('Novedades en Disney+'), findsNothing);
    expect(find.text('Coco', skipOffstage: false), findsNothing);
    expect(find.text('Iron Man', skipOffstage: false), findsOneWidget);
  });

  testWidgets('Buscador filtra por título', (tester) async {
    await iniciarSesion(tester);
    await tester.tap(find.text('Buscar'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'toy');
    await tester.pumpAndSettle();
    expect(find.text('1 resultados'), findsOneWidget);
    expect(find.text('Toy Story'), findsOneWidget);
  });

  testWidgets('Detalle muestra la sinopsis de una película', (tester) async {
    await iniciarSesion(tester);
    await tester.tap(find.text('VER'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Moana recibe', skipOffstage: false),
        findsOneWidget);
  });
}
