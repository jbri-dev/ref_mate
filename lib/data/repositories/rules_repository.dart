import 'package:ref_mate/data/app_database.dart';
import 'dart:math';

class RulesRepository {
  static final _random = Random();

  Future<List<Map<String, dynamic>>> getAllRules() async {
    final db = await AppDatabase.database;
    return await db.query('rules', orderBy: 'id ASC');
  }

  Future<Map<String, dynamic>?> getRandomRule() async {
    final rules = await getAllRules();
    if (rules.isEmpty) return null;
    return rules[_random.nextInt(rules.length)];
  }
}
