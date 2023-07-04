import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  final String text;
  final void Function() onResponse;

  const Response({super.key, required this.text, required this.onResponse});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: double.infinity,
        child: ElevatedButton(onPressed: onResponse, child: Text(text)));
  }
}
