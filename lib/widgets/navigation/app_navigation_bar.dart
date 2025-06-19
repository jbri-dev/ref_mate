import 'package:flutter/material.dart';
import 'package:ref_mate/constants/app_colors.dart';
import 'package:ref_mate/constants/app_radii.dart';
import 'package:ref_mate/constants/app_shadows.dart';
import 'package:ref_mate/widgets/navigation/app_navigation_icon.dart';

class AppNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const List<IconData> _icons = [
    Icons.home_rounded,
    Icons.sports_basketball_rounded,
    Icons.storage_rounded,
    Icons.rule_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: PhysicalModel(
        color: AppColors.transparent,
        elevation: 8,
        borderRadius: AppRadii.navigationBar,
        shadowColor: AppColors.secondary.withValues(alpha: .3),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.navigation,
            borderRadius: AppRadii.navigationBar,
            boxShadow: [AppShadows.navigationBar],
          ),
          child: SizedBox(
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                _icons.length,
                (index) => AppNavigationIcon(
                  icon: _icons[index],
                  selected: currentIndex == index,
                  onTap: () => onTap(index),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
