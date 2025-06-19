import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ref_mate/pages/rules/providers/rules_providers.dart';
import 'package:ref_mate/pages/rules/widgets/list/rules_list_card.dart';
import 'package:ref_mate/pages/rules/widgets/list/rules_list_empty_widget.dart';
import 'package:ref_mate/pages/rules/widgets/list/rules_list_search_field.dart';
import 'package:ref_mate/widgets/common/app_back_button.dart';

final rulesListSearchProvider = StateProvider<String>((ref) => '');

class RulesListPage extends ConsumerWidget {
  const RulesListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(rulesListSearchProvider);
    final rulesAsync = ref.watch(allRulesProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: RulesListSearchField(
                      initialValue: search,
                      onChanged: (value) =>
                          ref.read(rulesListSearchProvider.notifier).state =
                              value,
                    ),
                  ),
                  Expanded(
                    child: rulesAsync.when(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (e, _) => Center(child: Text('Fehler: $e')),
                      data: (rules) {
                        final filtered = search.trim().isEmpty
                            ? rules
                            : rules.where((rule) {
                                final q = (rule['question'] ?? '')
                                    .toString()
                                    .toLowerCase();
                                return q.contains(search.toLowerCase());
                              }).toList();
                        if (filtered.isEmpty) {
                          return const RulesListEmptyWidget();
                        }
                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          itemCount: filtered.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 10),
                          itemBuilder: (context, i) {
                            final rule = filtered[i];
                            return RulesListCard(
                              number: (rule['number'] ?? rule['id'] ?? '')
                                  .toString(),
                              question: rule['question'] ?? '',
                              answerText: rule['answer_text'] ?? '',
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
