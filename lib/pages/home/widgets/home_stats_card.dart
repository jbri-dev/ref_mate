import 'package:flutter/material.dart';
import 'package:ref_mate/constants/app_colors.dart';

class HomeStatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? color;

  const HomeStatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? AppColors.cardBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 32, color: AppColors.accent),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.secondary,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeStatsOverview extends StatelessWidget {
  final List<HomeStat> stats;
  const HomeStatsOverview({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          childAspectRatio: 2.1,
          children: stats.map((stat) => _StatTile(stat: stat)).toList(),
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final HomeStat stat;
  const _StatTile({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(stat.icon, size: 32, color: AppColors.accent),
          const SizedBox(height: 2),
          Text(
            stat.value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          Text(
            stat.title,
            style: const TextStyle(fontSize: 11, color: AppColors.secondary),
          ),
        ],
      ),
    );
  }
}

class HomeStat {
  final String title;
  final String value;
  final IconData icon;
  const HomeStat({
    required this.title,
    required this.value,
    required this.icon,
  });
}
