import 'package:flutter/material.dart';

class RulesLearnAnswerButtons extends StatelessWidget {
  final void Function(String) onAnswer;
  const RulesLearnAnswerButtons({super.key, required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          ),
          onPressed: () => onAnswer('ja'),
          child: const Text('Ja'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          ),
          onPressed: () => onAnswer('nein'),
          child: const Text('Nein'),
        ),
      ],
    );
  }
}
