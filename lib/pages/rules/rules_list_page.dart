import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ref_mate/constants/app_colors.dart';
import 'package:ref_mate/pages/rules/providers/rules_providers.dart';
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
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Regeltext oder Stichwort suchen...',
                        filled: true,
                        fillColor: AppColors.cardBackground,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 12,
                        ),
                      ),
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
                          return const Center(
                            child: Text(
                              'Keine passenden Regelfragen gefunden.',
                            ),
                          );
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
                            return Card(
                              color: AppColors.cardBackground,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 8,
                                  bottom: 16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        (rule['number'] ?? rule['id'] ?? '')
                                            .toString(),
                                        style: TextStyle(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      rule['question'] ?? '',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      rule['answer_text'] ?? '',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
