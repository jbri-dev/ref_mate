import 'package:flutter/material.dart';
import 'app_bottom_nav_bar.dart';
import '../../pages/home/home_page.dart';
import '../../pages/games/games_page.dart';
import '../../pages/master_data/master_data_page.dart';
import '../../pages/rules/rules_page.dart';

class MainNavigationWidget extends StatefulWidget {
  const MainNavigationWidget({super.key});

  @override
  State<MainNavigationWidget> createState() => _MainNavigationWidgetState();
}

class _MainNavigationWidgetState extends State<MainNavigationWidget> {
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
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
