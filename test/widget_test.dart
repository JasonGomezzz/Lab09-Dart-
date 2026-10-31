import 'package:flutter_test/flutter_test.dart';
import 'package:streaming_app/main.dart';
import 'package:streaming_app/widgets/imagen_nube.dart';

void main() {
  // Sin red en los tests: evita reintentos con temporizadores pendientes.
  setUp(() => ImagenNube.maxIntentos = 0);

  testWidgets('Inicio navega a Disney+ y muestra sus secciones',
      (tester) async {
    await tester.pumpWidget(const StreamingApp());
    expect(find.text('Tu mundo de historias'), findsOneWidget);

    await tester.tap(find.text('ENTRAR'));
    await tester.pumpAndSettle();

    expect(find.text('Novedades en Disney+'), findsOneWidget);
    expect(find.text('Inicio'), findsOneWidget);
  });

  testWidgets('Detalle muestra la sinopsis de una película', (tester) async {
    await tester.pumpWidget(const StreamingApp());
    await tester.tap(find.text('ENTRAR'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('VER'));
    await tester.pumpAndSettle();

    expect(find.text('Moana 2'), findsWidgets);
    expect(find.textContaining('Moana recibe', skipOffstage: false), findsOneWidget);
  });
}
