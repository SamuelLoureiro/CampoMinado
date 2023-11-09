import 'package:campo/models/campo_user.dart';
import 'package:flutter/material.dart';
import '/screens/campo_minado_app.dart';
import '/screens/loading_page.dart';
import 'package:firebase_core/firebase_core.dart';
import '/servicos/auth_service.dart';
import '/screens/auth_pag.dart';

class AuthOrPag extends StatelessWidget {
  const AuthOrPag({super.key});

  Future<void> init(BuildContext context) async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(context),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPage();
        } else {
          return StreamBuilder<CampoUser?>(
            stream: AuthService().userChanges,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingPage();
              } else {
                return snapshot.hasData ? CampoMinadoApp() : const AuthPage();
              }
            },
          );
        }
      },
    );
  }
}
