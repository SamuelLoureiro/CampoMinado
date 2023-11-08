/*import 'package:flutter/material.dart';
import '../models/campo.dart';
import '/screens/campo_minado_app.dart';
import '/models/tabuleiro.dart';

class DificuldadeSelecaoTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione a Dificuldade'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Fácil'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CampoMinadoApp(qtdeBombas: 10)),
                );
              },
            ),
            ElevatedButton(
              child: Text('Médio'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CampoMinadoApp(qtdeBombas: 30)),
                );
              },
            ),
            ElevatedButton(
              child: Text('Difícil'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CampoMinadoApp(qtdeBombas: 50)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}*/
