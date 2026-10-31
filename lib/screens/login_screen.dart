import 'package:flutter/material.dart';
import '../widgets/logo_disney.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final _correo = TextEditingController();
  final _clave = TextEditingController();
  bool _ocultar = true;

  @override
  void dispose() {
    _correo.dispose();
    _clave.dispose();
    super.dispose();
  }

  void _entrar() {
    if (_form.currentState!.validate()) {
      Navigator.pushNamedAndRemoveUntil(context, '/disney', (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(child: LogoDisney(tamano: 40)),
              const SizedBox(height: 28),
              Text('Inicia sesión', style: tema.textTheme.headlineSmall),
              const SizedBox(height: 4),
              Text('Demostración: acepta cualquier correo válido y una '
                  'contraseña de 6 caracteres o más.',
                  style: tema.textTheme.bodyMedium),
              const SizedBox(height: 24),
              TextFormField(
                controller: _correo,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Correo electrónico'),
                validator: (v) => (v == null || !v.contains('@') || !v.contains('.'))
                    ? 'Ingresa un correo válido'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _clave,
                obscureText: _ocultar,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  suffixIcon: IconButton(
                    icon: Icon(
                        _ocultar ? Icons.visibility : Icons.visibility_off),
                    onPressed: () => setState(() => _ocultar = !_ocultar),
                  ),
                ),
                validator: (v) => (v == null || v.length < 6)
                    ? 'Mínimo 6 caracteres'
                    : null,
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: _entrar,
                  child: const Text('INICIAR SESIÓN'),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/planes'),
                child: const Text('¿Aún no tienes cuenta? Suscríbete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
