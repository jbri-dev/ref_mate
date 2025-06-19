import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ref_mate/pages/rules/providers/rules_providers.dart';
import 'package:ref_mate/pages/rules/providers/rules_test_provider.dart';
import 'package:ref_mate/widgets/common/app_back_button.dart';
import 'package:ref_mate/pages/rules/widgets/learn/rules_learn_answer_buttons.dart';
import 'package:ref_mate/pages/rules/widgets/learn/rules_learn_question_card.dart';
import 'package:ref_mate/pages/rules/widgets/test/rules_test_result_list.dart';

class RulesTestPage extends ConsumerWidget {
  const RulesTestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allRulesAsync = ref.watch(allRulesProvider);
    final testState = ref.watch(rulesTestProvider);
    final testNotifier = ref.read(rulesTestProvider.notifier);

    if (allRulesAsync.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (allRulesAsync.hasError ||
        allRulesAsync.value == null ||
        allRulesAsync.value!.isEmpty) {
      return const Scaffold(
        body: Center(child: Text('Fehler beim Laden der Fragen.')),
      );
    }
    if (testState.questions.isEmpty &&
        allRulesAsync.value != null &&
        allRulesAsync.value!.isNotEmpty) {
      // Initialisiere Fragen nur, wenn noch keine geladen wurden
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (ref.read(rulesTestProvider).questions.isEmpty) {
          testNotifier.initQuestions(allRulesAsync.value!);
        }
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (testState.showResult) {
      final correct = testState.questions
          .asMap()
          .entries
          .where((e) => testState.answers[e.key] == e.value['answer'])
          .length;
      final wrongCount = testState.questions.length - correct;
      final passed = wrongCount <= 7;
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24),
                const Text(
                  'Auswertung',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  'Du hast $correct von ${testState.questions.length} Fragen richtig beantwortet.',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  passed ? 'Bestanden!' : 'Nicht bestanden (mehr als 7 Fehler)',
                  style: TextStyle(
                    fontSize: 17,
                    color: passed ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: RulesTestResultList(
                    questions: testState.questions,
                    answers: testState.answers,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Zurück'),
                ),
              ],
            ),
          ),
        ),
      );
    }
    final q = testState.questions[testState.currentIndex];
    final remaining = testState.endTime.difference(DateTime.now());
    if (remaining.isNegative) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => testNotifier.finishTest(),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: AppBackButton(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 56),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Verbleibende Zeit: ${remaining.inMinutes.toString().padLeft(2, '0')}:${(remaining.inSeconds % 60).toString().padLeft(2, '0')}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: List.generate(
                        testState.questions.length,
                        (i) => GestureDetector(
                          onTap: () => testNotifier.goToQuestion(i),
                          child: CircleAvatar(
                            radius: 13,
                            backgroundColor: i == testState.currentIndex
                                ? Theme.of(context).colorScheme.primary
                                : (testState.answers[i] != null
                                      ? Colors.green
                                      : Colors.grey[300]),
                            child: Text(
                              '${i + 1}',
                              style: TextStyle(
                                color: i == testState.currentIndex
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: RulesLearnQuestionCard(
                      question: q['question'] ?? '',
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Spacer(),
                  RulesLearnAnswerButtons(
                    onAnswer: (answer) {
                      testNotifier.selectAnswer(answer);
                      if (testState.currentIndex <
                          testState.questions.length - 1) {
                        Future.delayed(const Duration(milliseconds: 150), () {
                          testNotifier.goToQuestion(testState.currentIndex + 1);
                        });
                      }
                    },
                    selected: testState.answers[testState.currentIndex],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: testState.currentIndex > 0
                            ? () => testNotifier.goToQuestion(
                                testState.currentIndex - 1,
                              )
                            : null,
                        child: const Text('Zurück'),
                      ),
                      ElevatedButton(
                        onPressed: testState.answers.every((a) => a != null)
                            ? testNotifier.finishTest
                            : null,
                        child: const Text('Test beenden'),
                      ),
                      TextButton(
                        onPressed:
                            testState.currentIndex <
                                testState.questions.length - 1
                            ? () => testNotifier.goToQuestion(
                                testState.currentIndex + 1,
                              )
                            : null,
                        child: const Text('Weiter'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
