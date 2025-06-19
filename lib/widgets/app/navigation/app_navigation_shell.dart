import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ref_mate/pages/games/games_page.dart';
import 'package:ref_mate/pages/home/home_page.dart';
import 'package:ref_mate/pages/master_data/master_data_page.dart';
import 'package:ref_mate/pages/rules/rules_page.dart';
import 'package:ref_mate/providers/navigation_provider.dart';
import 'package:ref_mate/widgets/app/navigation/app_navigation_bar.dart';

class AppNavigationShell extends ConsumerWidget {
  const AppNavigationShell({super.key});

  static final List<Widget> _pages = const [
    HomePage(),
    GamesPage(),
    MasterDataPage(),
    RulesPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationIndexProvider);
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 180),
        transitionBuilder: (child, animation) =>
            FadeTransition(opacity: animation, child: child),
        child: _pages[selectedIndex],
      ),
      bottomNavigationBar: AppNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) =>
            ref.read(navigationIndexProvider.notifier).state = index,
      ),
    );
  }
}
