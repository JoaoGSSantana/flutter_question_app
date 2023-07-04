import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int points;
  final void Function() onRestart;

  const Result(
    this.points,
    this.onRestart, {
    super.key,
  });

  String get resultText {
    if (points <= 8) {
      return 'Parabéns!';
    } else if (points <= 10) {
      return 'Muito bom!';
    } else if (points <= 16) {
      return 'Excelente!';
    } else {
      return 'Genial!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          resultText,
          style: const TextStyle(
            fontSize: 32,
          ),
        )),
        TextButton(
            onPressed: onRestart,
            child: const Text(
              "Reiniciar?",
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );
  }
}
