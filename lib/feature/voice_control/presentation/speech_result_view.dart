import 'package:flutter/material.dart';

class SpeechResultView extends StatelessWidget {
  const SpeechResultView({super.key});

  static const path = 'speech_result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech Result'),
      ),
      body: const Center(
        child: Text(
          '遷移後',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}