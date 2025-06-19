import 'package:flutter/material.dart';

class RulesLearnQuestionCard extends StatelessWidget {
  final String question;
  const RulesLearnQuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          question,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
