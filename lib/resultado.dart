import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao <= 29) {
      return 'Parabéns!';
    } else if (pontuacao >= 30 && pontuacao <= 35) {
      return 'Muito bem!';
    } else {
      return 'Impressionante!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(fraseResultado, style: TextStyle(fontSize: 28))),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: Text(
            'Reiniciar',
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
