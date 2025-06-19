import 'package:flutter/material.dart';
import 'package:ref_mate/widgets/app/navigation/app_navigation_icon.dart';
import 'package:ref_mate/constants/app_colors.dart';

class AppNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: PhysicalModel(
        color: Colors.transparent,
        elevation: 8,
        borderRadius: BorderRadius.circular(28),
        shadowColor: AppColors.secondary.withValues(alpha: .3),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(28),
          ),
          child: SizedBox(
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppNavigationIcon(
                  icon: Icons.home_rounded,
                  selected: currentIndex == 0,
                  onTap: () => onTap(0),
                ),
                AppNavigationIcon(
                  icon: Icons.sports_basketball_rounded,
                  selected: currentIndex == 1,
                  onTap: () => onTap(1),
                ),
                AppNavigationIcon(
                  icon: Icons.storage_rounded,
                  selected: currentIndex == 2,
                  onTap: () => onTap(2),
                ),
                AppNavigationIcon(
                  icon: Icons.rule_rounded,
                  selected: currentIndex == 3,
                  onTap: () => onTap(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
