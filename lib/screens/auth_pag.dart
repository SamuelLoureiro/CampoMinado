import '/models/auth_form.dart';
import 'package:flutter/material.dart';
import '/models/auth_form_data.dart';
import '/servicos/auth_service.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      setState(() => _isLoading = true);

      if (formData.isLogin) {
        await AuthService().login(
          formData.email,
          formData.password,
        );
      } else {
        await AuthService().signup(
            formData.name, formData.email, formData.password, formData.image);
      }
    } catch (error) {
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 30, 83),
      body: Stack(
        children: [
          AppBar(
            title: Container(
              child: Text(
                'To-Do List',
                style: TextStyle(color: Colors.white),
              ),
            ),
            backgroundColor: Color.fromARGB(255, 21, 30, 83),
            elevation: 0,
          ),
          Center(
            child: SingleChildScrollView(
              child: AuthForm(onSubmit: _handleSubmit),
            ),
          ),
          if (_isLoading)
            Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
        ],
      ),
    );
  }
}
