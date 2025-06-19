import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ref_mate/data/repositories/rules_repository.dart';

final rulesRepositoryProvider = Provider<RulesRepository>(
  (ref) => RulesRepository(),
);

final randomSeedProvider = StateProvider<int>((ref) => 0);

final randomRuleProvider = FutureProvider<Map<String, dynamic>?>((ref) async {
  final repo = ref.watch(rulesRepositoryProvider);
  return await repo.getRandomRule();
});

class AllRulesNotifier extends AsyncNotifier<List<Map<String, dynamic>>> {
  @override
  Future<List<Map<String, dynamic>>> build() async {
    final repo = ref.watch(rulesRepositoryProvider);
    return await repo.getAllRules();
  }
}

final allRulesProvider =
    AsyncNotifierProvider<AllRulesNotifier, List<Map<String, dynamic>>>(
      AllRulesNotifier.new,
    );
