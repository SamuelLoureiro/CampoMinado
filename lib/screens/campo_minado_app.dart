import 'package:campo/components/tabuleiro_widget.dart';
import 'package:campo/models/explosao_exception.dart';
import 'package:campo/models/tabuleiro.dart';
import 'package:campo/servicos/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:campo/components/resultado_widget.dart';
import '../models/campo.dart';

class CampoMinadoApp extends StatefulWidget {
  const CampoMinadoApp({super.key});

  @override
  State<CampoMinadoApp> createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool? _venceu;
  Tabuleiro? _tabuleiro;

  void _reiniciar() {
    setState(() {
      _venceu = null;
      _tabuleiro!.reiniciar();
    });
  }

  void _abrir(Campo campo) {
    if (_venceu != null) {
      return;
    }

    setState(() {
      try {
        campo.abrir();
        if (_tabuleiro!.resolvido) {
          _venceu = true;
        }
      } on ExplosaoException {
        _venceu = false;
        _tabuleiro!.revelarBombas();
      }
    });
  }

  void _alternarMarcacao(Campo campo) {
    if (_venceu != null) {
      return;
    }

    setState(() {
      campo.alternarMarcacao();
      if (_tabuleiro!.resolvido) {
        _venceu = true;
      }
    });
  }

  Tabuleiro _getTabuleiro(double largura, double altura) {
    if (_tabuleiro == null) {
      int qtdeColunas = 15;
      double tamanhoCampo = largura / qtdeColunas;
      int qtdeLinhas = (altura / tamanhoCampo).floor();

      _tabuleiro = Tabuleiro(
        linhas: qtdeLinhas,
        colunas: qtdeColunas,
        qtdeBombas: 50,
      );
    }
    return _tabuleiro!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: _venceu,
          onReiniciar: _reiniciar,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Dificuldade',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Fácil'),
                onTap: () {
                  setState(() {
                    _tabuleiro = Tabuleiro(
                      linhas: 15,
                      colunas: 15,
                      qtdeBombas: 30,
                    );
                    _reiniciar();
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.star_half),
                title: Text('Médio'),
                onTap: () {
                  setState(() {
                    _tabuleiro = Tabuleiro(
                      linhas: 15,
                      colunas: 15,
                      qtdeBombas: 30,
                    );
                    _reiniciar();
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.star_border),
                title: Text('Difícil'),
                onTap: () {
                  setState(() {
                    _tabuleiro = Tabuleiro(
                      linhas: 15,
                      colunas: 15,
                      qtdeBombas: 30,
                    );
                    _reiniciar();
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () => AuthService().logout(),
              ),
            ],
          ),
        ),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return TabuleiroWidget(
                tabuleiro: _getTabuleiro(
                  constraints.maxWidth,
                  constraints.maxHeight,
                ),
                onAbrir: _abrir,
                onAlternarMarcacao: _alternarMarcacao,
              );
            },
          ),
        ),
      ),
    );
  }
}
