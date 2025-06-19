import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ref_mate/pages/rules/providers/rules_learn_providers.dart';

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
                  Card(
                    color: Theme.of(context).cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        rule['question'] ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (!_showSolution) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            foregroundColor: Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 14,
                            ),
                          ),
                          onPressed: () => _answer('ja', rule),
                          child: const Text('Ja'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            foregroundColor: Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 14,
                            ),
                          ),
                          onPressed: () => _answer('nein', rule),
                          child: const Text('Nein'),
                        ),
                      ],
                    ),
                  ] else ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _isCorrect! ? Icons.check_circle : Icons.cancel,
                          color: _isCorrect! ? Colors.green : Colors.red,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _isCorrect! ? 'Richtig!' : 'Falsch!',
                          style: TextStyle(
                            color: _isCorrect! ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      rule['answer_text'] ?? '',
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.secondary,
                        decoration: TextDecoration.none,
                        fontFamily: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.fontFamily,
                        fontWeight:
                            Theme.of(
                              context,
                            ).textTheme.bodyMedium?.fontWeight ??
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1,
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: _loadRandomRule,
                    ),
                  ],
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
