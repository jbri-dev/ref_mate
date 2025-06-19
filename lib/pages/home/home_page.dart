import 'package:flutter/material.dart';
import 'package:ref_mate/constants/app_colors.dart';
import 'package:ref_mate/pages/home/widgets/home_game_card.dart';
import 'package:ref_mate/pages/home/widgets/home_stats_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Statistiken
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                'Dein Überblick',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
            ),
            const HomeStatsOverview(
              stats: [
                HomeStat(
                  title: 'Gesamt verdient',
                  value: '1.250 €',
                  icon: Icons.euro,
                ),
                HomeStat(
                  title: 'Gewinn (ohne Fahrt)',
                  value: '1.050 €',
                  icon: Icons.trending_up,
                ),
                HomeStat(
                  title: 'Spiele diese Saison',
                  value: '24',
                  icon: Icons.sports_basketball,
                ),
                HomeStat(
                  title: 'km gefahren',
                  value: '1.340',
                  icon: Icons.directions_car,
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Nächste Spiele',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // Dummy-Spiele
            HomeGameCard(
              teamA: 'Baskets Bonn',
              teamB: 'Alba Berlin',
              colleague: 'Max Mustermann',
              location: 'Telekom Dome',
              dateTime: '21.06.2025, 18:00',
              league: 'BBL',
            ),
            HomeGameCard(
              teamA: 'FC Bayern',
              teamB: 'EWE Oldenburg',
              colleague: 'Lisa Müller',
              location: 'Audi Dome',
              dateTime: '23.06.2025, 20:00',
              league: 'BBL',
            ),
            HomeGameCard(
              teamA: 'Rasta Vechta',
              teamB: 'MLP Heidelberg',
              colleague: 'Tom Schmidt',
              location: 'Rasta Dome',
              dateTime: '25.06.2025, 19:30',
              league: 'ProA',
            ),
            HomeGameCard(
              teamA: 'Towers Hamburg',
              teamB: 's.Oliver Würzburg',
              colleague: 'Anna Becker',
              location: 'edel-optics.de Arena',
              dateTime: '28.06.2025, 17:00',
              league: 'BBL',
            ),
          ],
        ),
      ),
    );
  }
}
