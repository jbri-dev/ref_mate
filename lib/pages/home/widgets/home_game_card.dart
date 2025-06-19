import 'package:flutter/material.dart';
import 'package:ref_mate/constants/app_colors.dart';

class HomeGameCard extends StatelessWidget {
  final String teamA;
  final String teamB;
  final String colleague;
  final String location;
  final String dateTime;
  final String league;

  const HomeGameCard({
    super.key,
    required this.teamA,
    required this.teamB,
    required this.colleague,
    required this.location,
    required this.dateTime,
    required this.league,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '$teamA vs $teamB',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  league,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.person, size: 18, color: AppColors.secondary),
                const SizedBox(width: 4),
                Text(colleague, style: const TextStyle(fontSize: 14)),
                const SizedBox(width: 16),
                const Icon(Icons.place, size: 18, color: AppColors.secondary),
                const SizedBox(width: 4),
                Text(location, style: const TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 18,
                  color: AppColors.secondary,
                ),
                const SizedBox(width: 4),
                Text(dateTime, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
