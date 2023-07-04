import 'package:flutter/material.dart';
import 'package:question_project/widget/question.dart';
import 'package:question_project/widget/response.dart';

class Quiz extends StatelessWidget {
  final int selectedQuestion;
  final List<Map<String, Object>> questions;
  final void Function(Object points) onResponse;

  const Quiz(
      {super.key,
      required this.selectedQuestion,
      required this.questions,
      required this.onResponse});

  bool get haveQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> responses = haveQuestion
        ? questions[selectedQuestion]['response'] as List<Map<String, Object>>
        : [];

    return Column(
      children: <Widget>[
        Question(questions[selectedQuestion]['text'] as String),
        ...responses
            .map((resp) => Response(
                text: resp['text'] as String,
                onResponse: () => onResponse(resp['points']!)))
            .toList(),
      ],
    );
  }
}
