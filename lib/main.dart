import 'package:flutter/material.dart';
import 'package:question_project/widget/quiz.dart';
import 'package:question_project/widget/result.dart';

main() => runApp(const QuestionApp());

class QuestionApp extends StatefulWidget {
  const QuestionApp({super.key});

  @override
  State<QuestionApp> createState() => _QuestionAppState();
}

class _QuestionAppState extends State<QuestionApp> {
  var _selectedQuestion = 0;
  var _totalOfPoints = 0;

  static const List<Map<String, Object>> questions = [
    {
      'text': "Qual é a sua cor favorita?",
      "response": [
        {"text": "Vermelho", "points": 5},
        {"text": "Azul", "points": 8},
        {"text": "Amarelo", "points": 6},
        {"text": "Verde", "points": 1},
        {"text": "Preto", "points": 10},
      ],
    },
    {
      'text': "Qual é o seu animal favorito?",
      "response": [
        {"text": "Cachorro", "points": 10},
        {"text": "Gato", "points": 9},
        {"text": "Papagaio", "points": 6},
        {"text": "Peixe", "points": 5},
        {"text": "Leão", "points": 1}
      ]
    },
    {
      'text': "Qual é o seu time favorito?",
      "response": [
        {"text": "Corinthians", "points": 10},
        {"text": "Santos", "points": 7},
        {"text": "São Paulo", "points": 5},
        {"text": "Palmeiras", "points": 1},
        {"text": "Vasco da Gama", "points": 9}
      ]
    }
  ];

  void _response(points) {
    if (haveQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalOfPoints += points as int;
      });
    }
  }

  bool get haveQuestion {
    return _selectedQuestion < questions.length;
  }

  void _onRestartQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _totalOfPoints = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Questions', textAlign: TextAlign.center),
          centerTitle: true,
        ),
        body: haveQuestion
            ? Quiz(
                selectedQuestion: _selectedQuestion,
                questions: questions,
                onResponse: _response)
            : Result(_totalOfPoints, _onRestartQuiz),
      ),
    );
  }
}
