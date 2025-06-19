import 'package:flutter/material.dart';
import 'package:ref_mate/constants/app_colors.dart';

class RulesLearnAnswerButtons extends StatelessWidget {
  final void Function(String) onAnswer;
  final String? selected;
  const RulesLearnAnswerButtons({
    super.key,
    required this.onAnswer,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final selectedColor = AppColors.selected;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: selected == 'ja' ? selectedColor : primary,
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
            backgroundColor: selected == 'nein' ? selectedColor : primary,
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
