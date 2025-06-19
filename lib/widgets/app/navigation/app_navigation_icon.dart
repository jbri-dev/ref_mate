import 'package:flutter/material.dart';
import 'package:ref_mate/constants/app_colors.dart';

class AppNavigationIcon extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const AppNavigationIcon({
    required this.icon,
    required this.selected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),
          child: Icon(
            icon,
            key: ValueKey<bool>(selected),
            size: 32,
            color: selected ? AppColors.accent : AppColors.secondary,
          ),
        ),
      ),
    );
  }
}
