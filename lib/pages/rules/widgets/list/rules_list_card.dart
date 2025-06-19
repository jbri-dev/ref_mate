import 'package:flutter/material.dart';
import 'package:ref_mate/constants/app_colors.dart';

class RulesListCard extends StatelessWidget {
  final String number;
  final String question;
  final String answerText;
  const RulesListCard({
    super.key,
    required this.number,
    required this.question,
    required this.answerText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                number,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              question,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              answerText,
              style: TextStyle(fontSize: 14, color: AppColors.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
