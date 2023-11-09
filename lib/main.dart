import 'package:campo/firebase_options.dart';
import 'package:campo/screens/campo_minado_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/screens/auth_or_app_pag.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campo Minado',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AuthOrPag(),
      debugShowCheckedModeBanner: false,
    );
  }
}
