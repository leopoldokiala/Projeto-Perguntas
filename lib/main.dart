import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': <Map<String, Object>>[
        {'texto': 'Cão', 'pontuacao': 10},
        {'texto': 'Gato', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 8},
        {'texto': 'Leão', 'pontuacao': 6},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Leonardo Leitão', 'pontuacao': 10},
        {'texto': 'Ricarth Lima', 'pontuacao': 7},
        {'texto': 'Daniel Ciolf', 'pontuacao': 8},
        {'texto': 'Jacob Moura', 'pontuacao': 9},
      ],
    },
    {
      'texto': 'O que mais você gosta de fazer?',
      'respostas': [
        {'texto': 'Dormir 🛌🏾', 'pontuacao': 8},
        {'texto': 'Programar 💻', 'pontuacao': 10},
        {'texto': 'Assistir 📺', 'pontuacao': 7},
        {'texto': 'Jogar Futebol ⚽', 'pontuacao': 9},
      ],
    },
    {
      'texto': 'Quem é o seu amigo favorito?',
      'respostas': [
        {'texto': 'Maqueleca Francisco', 'pontuacao': 10},
        {'texto': 'Evandro João', 'pontuacao': 9},
        {'texto': 'Gildo Leão', 'pontuacao': 8},
        {'texto': 'Erivaldo Dos Santos', 'pontuacao': 7},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada)
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text('Perguntas', style: TextStyle(color: Colors.white)),
        ),
        body:
            temPerguntaSelecionada
                ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  quandoResponder: _responder,
                )
                : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
