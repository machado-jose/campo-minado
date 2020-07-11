import 'dart:math';

import 'package:campo_minado/models/campo.dart';
import 'package:flutter/material.dart';

class Tabuleiro {
  final int linhas;
  final int colunas;
  final int qtdBombas;

  List<Campo> _campos = [];

  Tabuleiro({
    @required this.linhas,
    @required this.colunas,
    @required this.qtdBombas,
  }) {
    this._criarCampos();
    this._relacionarVizinhos();
    this._sortearMinas();
  }

  void reiniciar(){
    this._campos.forEach((c) => c.reiniciar());
    this._sortearMinas();
  }

  void revelarBombas(){
    this._campos.forEach((c) => c.revelarBomba());
  }

  void _criarCampos() {
    for (int l = 0; l < this.linhas; l++) {
      for (int c = 0; c < this.colunas; c++) {
        this._campos.add(Campo(
              linha: l,
              coluna: c,
            ));
      }
    }
  }

  void _relacionarVizinhos() {
    for (var c in this._campos) {
      for (var vizinho in this._campos) {
        c.adicionarVizinho(vizinho);
      }
    }
  }

  void _sortearMinas() {
    int sorteadas = 0;

    if(this.qtdBombas > this.linhas * this.colunas) return;

    while(sorteadas < this.qtdBombas){
      int i = Random().nextInt(this._campos.length);

      if(!this._campos[i].minado){
        this._campos[i].minar();
        sorteadas++;
      }
    }
  }

  List<Campo> get campos{
    return this._campos;
  }

  bool get resolvido{
    return this._campos.every((c) => c.resolvido);
  }
}
