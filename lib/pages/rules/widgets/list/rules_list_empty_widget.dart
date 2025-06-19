import 'package:flutter/material.dart';

class RulesListEmptyWidget extends StatelessWidget {
  const RulesListEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Keine passenden Regelfragen gefunden.',
        style: TextStyle(fontSize: 16, color: Color(0xFF999999)),
        textAlign: TextAlign.center,
      ),
    );
  }
}
