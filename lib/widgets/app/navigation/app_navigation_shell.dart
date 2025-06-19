import 'package:flutter/material.dart';
import 'package:ref_mate/pages/home/home_page.dart';
import 'package:ref_mate/pages/games/games_page.dart';
import 'package:ref_mate/pages/master_data/master_data_page.dart';
import 'package:ref_mate/pages/rules/rules_page.dart';
import 'package:ref_mate/widgets/app/navigation/app_navigation_bar.dart';

class AppNavigationShell extends StatefulWidget {
  const AppNavigationShell({super.key});

  @override
  State<AppNavigationShell> createState() => _AppNavigationShellState();
}

class _AppNavigationShellState extends State<AppNavigationShell> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    GamesPage(),
    MasterDataPage(),
    RulesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: AppNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
