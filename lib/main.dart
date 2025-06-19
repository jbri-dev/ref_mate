import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ref_mate/constants/app_theme.dart';
import 'package:ref_mate/data/app_database.dart';
import 'package:ref_mate/widgets/app/navigation/app_navigation_shell.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.database;
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: appTheme, home: const AppNavigationShell());
  }
}
