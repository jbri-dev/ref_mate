import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

class RulesTestState {
  final List<Map<String, dynamic>> questions;
  final List<String?> answers;
  final int currentIndex;
  final DateTime endTime;
  final bool showResult;

  RulesTestState({
    required this.questions,
    required this.answers,
    required this.currentIndex,
    required this.endTime,
    required this.showResult,
  });

  RulesTestState copyWith({
    List<Map<String, dynamic>>? questions,
    List<String?>? answers,
    int? currentIndex,
    DateTime? endTime,
    bool? showResult,
  }) {
    return RulesTestState(
      questions: questions ?? this.questions,
      answers: answers ?? this.answers,
      currentIndex: currentIndex ?? this.currentIndex,
      endTime: endTime ?? this.endTime,
      showResult: showResult ?? this.showResult,
    );
  }
}

class RulesTestNotifier extends AutoDisposeNotifier<RulesTestState> {
  static const int questionCount = 25;
  static const int testDurationMinutes = 15;

  @override
  RulesTestState build() {
    return RulesTestState(
      questions: [],
      answers: List.filled(questionCount, null),
      currentIndex: 0,
      endTime: DateTime.now().add(const Duration(minutes: testDurationMinutes)),
      showResult: false,
    );
  }

  void initQuestions(List<Map<String, dynamic>> allQuestions) {
    final shuffled = List<Map<String, dynamic>>.from(allQuestions)
      ..shuffle(Random());
    state = state.copyWith(
      questions: shuffled.take(questionCount).toList(),
      answers: List.filled(questionCount, null),
      currentIndex: 0,
      endTime: DateTime.now().add(const Duration(minutes: testDurationMinutes)),
      showResult: false,
    );
  }

  void selectAnswer(String answer) {
    final updated = List<String?>.from(state.answers);
    updated[state.currentIndex] = answer;
    state = state.copyWith(answers: updated);
  }

  void goToQuestion(int idx) {
    state = state.copyWith(currentIndex: idx);
  }

  void finishTest() {
    state = state.copyWith(showResult: true);
  }
}

final rulesTestProvider =
    AutoDisposeNotifierProvider<RulesTestNotifier, RulesTestState>(
      RulesTestNotifier.new,
    );
