import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const AppBackButton({super.key, this.label = 'Zurück', this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.arrow_back),
      label: Text(label),
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.primary,
        textStyle: const TextStyle(fontSize: 16),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
    );
  }
}
