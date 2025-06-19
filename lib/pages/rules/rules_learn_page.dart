import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ref_mate/pages/rules/providers/rules_learn_providers.dart';
import 'package:ref_mate/pages/rules/widgets/learn/rules_learn_answer_buttons.dart';
import 'package:ref_mate/pages/rules/widgets/learn/rules_learn_question_card.dart';
import 'package:ref_mate/pages/rules/widgets/learn/rules_learn_solution.dart';

class RulesLearnPage extends ConsumerStatefulWidget {
  const RulesLearnPage({super.key});

  @override
  ConsumerState<RulesLearnPage> createState() => _RulesLearnPageState();
}

class _RulesLearnPageState extends ConsumerState<RulesLearnPage> {
  bool? _isCorrect;
  bool _showSolution = false;

  void _loadRandomRule() {
    setState(() {
      _isCorrect = null;
      _showSolution = false;
    });
    ref.read(randomSeedProvider.notifier).state++;
  }

  void _answer(String answer, Map<String, dynamic> rule) {
    setState(() {
      _isCorrect = rule['answer'] == answer;
      _showSolution = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ruleAsync = ref.watch(randomRuleProvider);
    if (ruleAsync.isLoading) {
      return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: const Center(child: CircularProgressIndicator()),
      );
    }
    final rule = ruleAsync.value;
    if (rule == null) {
      return const Center(child: Text('Keine Frage gefunden.'));
    }
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: TextButton.icon(
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Zurück'),
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    textStyle: const TextStyle(fontSize: 16),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RulesLearnQuestionCard(question: rule['question'] ?? ''),
                  const SizedBox(height: 24),
                  if (!_showSolution)
                    RulesLearnAnswerButtons(
                      onAnswer: (answer) => _answer(answer, rule),
                    )
                  else
                    RulesLearnSolution(
                      isCorrect: _isCorrect!,
                      answerText: rule['answer_text'] ?? '',
                      onNext: _loadRandomRule,
                    ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
