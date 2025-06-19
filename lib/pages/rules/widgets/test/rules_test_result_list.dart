import 'package:flutter/material.dart';

class RulesTestResultList extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final List<String?> answers;

  const RulesTestResultList({
    super.key,
    required this.questions,
    required this.answers,
  });

  @override
  Widget build(BuildContext context) {
    final wrong = questions
        .asMap()
        .entries
        .where(
          (e) => answers[e.key] != null && answers[e.key] != e.value['answer'],
        )
        .toList();
    if (wrong.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Falsche Antworten:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        ...wrong.map(
          (e) => Card(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.value['question'] ?? '',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Deine Antwort: ${answers[e.key] ?? '-'}',
                    style: const TextStyle(color: Colors.red),
                  ),
                  Text(
                    'Richtige Antwort: ${e.value['answer']}',
                    style: const TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
