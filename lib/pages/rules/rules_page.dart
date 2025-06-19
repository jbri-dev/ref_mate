import 'package:flutter/material.dart';
import 'package:ref_mate/pages/rules/rules_learn_page.dart';
import 'package:ref_mate/pages/rules/rules_list_page.dart';
import 'package:ref_mate/pages/rules/rules_test_page.dart';
import 'package:ref_mate/pages/rules/rules_documents_page.dart';
import 'package:ref_mate/constants/app_colors.dart';
import 'package:ref_mate/pages/rules/widgets/rules_menu_button.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            RulesMenuButton(
              icon: Icons.shuffle,
              label: 'Lernmodus (Zufallsfragen)',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RulesLearnPage()),
              ),
            ),
            const SizedBox(height: 20),
            RulesMenuButton(
              icon: Icons.list,
              label: 'Alle Fragen durchsuchen',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RulesListPage()),
              ),
            ),
            const SizedBox(height: 20),
            RulesMenuButton(
              icon: Icons.quiz,
              label: 'Testmodus (25 Fragen)',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RulesTestPage()),
              ),
            ),
            const SizedBox(height: 20),
            RulesMenuButton(
              icon: Icons.picture_as_pdf,
              label: 'Regel-Dokumente & Downloads',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RulesDocumentsPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
