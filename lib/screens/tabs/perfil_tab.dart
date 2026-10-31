import 'package:flutter/material.dart';

class PerfilTab extends StatelessWidget {
  const PerfilTab({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24),
      children: [
        Center(
          child: ClipOval(
            // Imagen local
            child: Image.asset('assets/images/avatar.png',
                width: 96, height: 96, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 12),
        Center(child: Text('Jason', style: tema.textTheme.headlineSmall)),
        Center(child: Text('Plan Premium (demostración)',
            style: tema.textTheme.bodyMedium)),
        const SizedBox(height: 24),
        const ListTile(
            leading: Icon(Icons.manage_accounts), title: Text('Cuenta')),
        ListTile(
          leading: const Icon(Icons.workspace_premium),
          title: const Text('Suscripción'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.pushNamed(context, '/planes'),
        ),
        const ListTile(
            leading: Icon(Icons.help_outline), title: Text('Ayuda')),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Cerrar sesión'),
          onTap: () =>
              Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false),
        ),
      ],
    );
  }
}
