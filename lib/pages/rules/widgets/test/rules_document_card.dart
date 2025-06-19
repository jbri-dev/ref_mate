import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'package:ref_mate/constants/app_colors.dart';

class RulesDocumentCard extends StatelessWidget {
  final String assetPath;
  final String title;

  const RulesDocumentCard({
    super.key,
    required this.assetPath,
    required this.title,
  });

  Future<void> _openPdf(BuildContext context) async {
    final bytes = await rootBundle.load(assetPath);
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/${assetPath.split('/').last}');
    await file.writeAsBytes(bytes.buffer.asUint8List(), flush: true);
    final result = await OpenFile.open(file.path);
    if (result.type != ResultType.done && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('PDF konnte nicht geöffnet werden.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackground,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: ListTile(
        leading: const Icon(
          Icons.picture_as_pdf,
          color: AppColors.accent,
          size: 32,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryText,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.open_in_new, color: AppColors.selected),
          onPressed: () => _openPdf(context),
        ),
        onTap: () => _openPdf(context),
      ),
    );
  }
}

// pubspec.yaml: open_file als Dependency ergänzen
// open_file: ^3.3.2
