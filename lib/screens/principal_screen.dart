import 'package:flutter/material.dart';
import '../theme/disney_theme.dart';
import '../widgets/logo_disney.dart';
import 'tabs/buscar_tab.dart';
import 'tabs/descargas_tab.dart';
import 'tabs/inicio_tab.dart';
import 'tabs/perfil_tab.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({super.key});

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  int _indice = 0;

  static const _tabs = [InicioTab(), BuscarTab(), DescargasTab(), PerfilTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const LogoDisney(),
        centerTitle: true,
      ),
      body: IndexedStack(index: _indice, children: _tabs),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: DisneyColors.fondo,
        type: BottomNavigationBarType.fixed,
        currentIndex: _indice,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        onTap: (i) => setState(() => _indice = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.download), label: 'Descargas'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
