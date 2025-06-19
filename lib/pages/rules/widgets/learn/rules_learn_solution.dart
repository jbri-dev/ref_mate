import 'package:flutter/material.dart';
import 'package:ref_mate/constants/app_colors.dart';

class RulesLearnSolution extends StatelessWidget {
  final bool isCorrect;
  final String answerText;
  final VoidCallback onNext;
  const RulesLearnSolution({
    super.key,
    required this.isCorrect,
    required this.answerText,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isCorrect ? Icons.check_circle : Icons.cancel,
              color: isCorrect ? AppColors.correct : AppColors.incorrect,
            ),
            const SizedBox(width: 8),
            Text(
              isCorrect ? 'Richtig!' : 'Falsch!',
              style: TextStyle(
                color: isCorrect ? AppColors.correct : AppColors.incorrect,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          answerText,
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).colorScheme.secondary,
            decoration: TextDecoration.none,
            fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
            fontWeight:
                Theme.of(context).textTheme.bodyMedium?.fontWeight ??
                FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        TextButton.icon(
          icon: const Icon(Icons.refresh),
          label: const Text('Nächste Frage'),
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.primary,
            textStyle: const TextStyle(fontSize: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
          onPressed: onNext,
        ),
      ],
    );
  }
}
