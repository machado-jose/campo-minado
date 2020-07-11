import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test("Resolvendo o Jogo", () {
    Tabuleiro tb = new Tabuleiro(
      linhas: 2,
      colunas: 2,
      qtdBombas: 0,
    );

    tb.campos[0].minar();
    tb.campos[3].minar();

    // Jogando...
    tb.campos[0].alternarMarcacao();
    tb.campos[1].abrir();
    tb.campos[2].abrir();
    tb.campos[3].alternarMarcacao();

    expect(tb.resolvido, isTrue);

  });
}
