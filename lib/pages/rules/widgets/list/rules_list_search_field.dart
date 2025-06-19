import 'package:flutter/material.dart';
import 'package:ref_mate/constants/app_colors.dart';

class RulesListSearchField extends StatefulWidget {
  final String initialValue;
  final ValueChanged<String> onChanged;
  const RulesListSearchField({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<RulesListSearchField> createState() => _RulesListSearchFieldState();
}

class _RulesListSearchFieldState extends State<RulesListSearchField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _controller.addListener(() {
      widget.onChanged(_controller.text);
    });
  }

  @override
  void didUpdateWidget(covariant RulesListSearchField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue &&
        _controller.text != widget.initialValue) {
      _controller.text = widget.initialValue;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: TextField(
        controller: _controller,
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
      ),
    );
  }
}
