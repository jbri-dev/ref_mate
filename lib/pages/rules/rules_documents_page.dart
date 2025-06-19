import 'package:flutter/material.dart';
import 'package:ref_mate/constants/app_colors.dart';
import 'package:ref_mate/pages/rules/widgets/test/rules_document_card.dart';
import 'package:ref_mate/widgets/common/app_back_button.dart';

class RulesDocumentsPage extends StatelessWidget {
  const RulesDocumentsPage({super.key});

  static final _pdfs = [
    {
      'title': 'Offizielle Basketball-Regeln',
      'asset': 'assets/pdfs/Offizielle_Basketball_Regeln.pdf',
    },
    {'title': 'Miniregeln', 'asset': 'assets/pdfs/Miniregeln.pdf'},
    {
      'title': 'Ausschreibung Saison 2025',
      'asset': 'assets/pdfs/Ausschreibung_Saison_2025.pdf',
    },
    {'title': 'MMV Kriterien', 'asset': 'assets/pdfs/MMV_Kriterien.pdf'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 0, 0),
              child: AppBackButton(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: Text(
                'Regel-Dokumente & Downloads',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                itemCount: _pdfs.length,
                separatorBuilder: (_, __) => const SizedBox(height: 4),
                itemBuilder: (context, i) => RulesDocumentCard(
                  assetPath: _pdfs[i]['asset']!,
                  title: _pdfs[i]['title']!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
