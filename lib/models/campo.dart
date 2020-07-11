import 'package:flutter/foundation.dart';
import 'explosao_exception.dart';

class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];

  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  bool _explodido = false;

  Campo({
    @required this.linha,
    @required this.coluna
  });

  void adicionarVizinho(Campo vizinho) {
    final deltaLinha = (linha - vizinho.linha).abs();
    final deltaColuna = (coluna - vizinho.coluna).abs();

    if (deltaColuna == 0 && deltaLinha == 0) return;

    if (deltaLinha <= 1 && deltaColuna <= 1) {
      vizinhos.add(vizinho);
    }
  }

  void abrir() {
    if (this._aberto) return;

    this._aberto = true;

    if (this._minado) {
      throw ExplosaoException();
    }

    if (this.vizinhancaSegura) {
      vizinhos.forEach((v) => v.abrir());
    }
  }

  void revelarBomba() {
    if (this._minado) {
      this._aberto = true;
    }
  }

  void minar() {
    this._minado = true;
  }

  void alternarMarcacao() {
    this._marcado = !this._marcado;
  }

  void reiniciar() {
    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;
  }

  bool get minado {
    return this._minado;
  }

  bool get explodido {
    return this.explodido;
  }

  bool get marcado {
    return this._marcado;
  }

  bool get aberto {
    return this._aberto;
  }

  bool get resolvido{
    bool minadoEMarcado = minado && marcado;
    bool seguroEAberto = !minado && aberto;
    return minadoEMarcado || seguroEAberto;
  }

  int get qtdeMinasNaVizinhanca{
    return vizinhos.where((v) => v.minado).length;
  }

  bool get vizinhancaSegura {
    return vizinhos.every((v) => !v.minado);
  }
}
