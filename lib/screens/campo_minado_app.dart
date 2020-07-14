import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/components/resultado_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explosao_exception.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  void _onReiniciar() {}

  void _onAbrir(Campo campo) {}

  void _onAlternarMarcacao(Campo campo) {}

  @override
  Widget build(BuildContext context) {
    Campo campo = new Campo(coluna: 0, linha: 0);

    Campo vizinho1 = new Campo(linha: 1, coluna: 0);
    Campo vizinho2 = new Campo(linha: 1, coluna: 1);
    vizinho1.minar();
    vizinho2.minar();
    campo.adicionarVizinho(vizinho1);
    campo.adicionarVizinho(vizinho2);

    try {
      //campo.minar();
      campo.alternarMarcacao();
    } on ExplosaoException {}

    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: null,
          onReiniciar: _onReiniciar,
        ),
        body: Container(
          child: CampoWidget(
            campo: campo,
            onAbrir: _onAbrir,
            onAlternarMarcacao: _onAlternarMarcacao,
          ),
        ),
      ),
    );
  }
}
