import '/models/user_image_picker.dart';
import '/models/auth_form_data.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;
  const AuthForm({super.key, required this.onSubmit});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _handleOnImagePick(File image) {
    _formData.image = image;
  }

  void _showerror(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: Theme.of(context).colorScheme.error,
    ));
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    if (_formData.image == null && _formData.isSignup) {
      return _showerror('Imagem não selecionada!');
    }
    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_formData.isSignup)
                userImagePicker(
                  onImagePick: _handleOnImagePick,
                ),
              const ColoredBox(color: Colors.white),
              if (_formData.isSignup)
                TextFormField(
                  key: const ValueKey('name'),
                  initialValue: _formData.name,
                  onChanged: (name) => _formData.name = name,
                  decoration: const InputDecoration(labelText: 'Nome'),
                  // ignore: no_leading_underscores_for_local_identifiers
                  validator: (_name) {
                    final name = _name ?? '';
                    if (name.trim().length < 5) {
                      return 'Nome deve ter no mínimo 5 caracteres';
                    }
                    return null;
                  },
                ),
              TextFormField(
                key: const ValueKey('email'),
                initialValue: _formData.email,
                onChanged: (email) => _formData.email = email,
                decoration: const InputDecoration(labelText: 'E-mail'),
                // ignore: no_leading_underscores_for_local_identifiers
                validator: (_email) {
                  final email = _email ?? '';
                  if (!email.contains('@')) {
                    return 'E-mail inválido';
                  }
                  return null;
                },
              ),
              TextFormField(
                key: const ValueKey('password'),
                initialValue: _formData.password,
                onChanged: (password) => _formData.password = password,
                obscureText: true,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(labelText: 'Senha'),
                validator: (_password) {
                  final password = _password ?? '';
                  if (password.length < 6) {
                    return 'senha deve ter no mínimo 6 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: _submit,
                child: Text(
                  _formData.isLogin ? 'Entrar' : 'Cadastrar',
                ),
              ),
              TextButton(
                child: Text(
                  _formData.isLogin
                      ? 'Criar uma nova conta?'
                      : 'Já possui uma conta?',
                ),
                onPressed: () {
                  setState(() {
                    _formData.toggleAuthMode();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
