import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ref_mate/data/schemas/rules_schema.dart';
import 'package:ref_mate/data/initial_data/rules_initial_data.dart';

class AppDatabase {
  static Database? _db;
  static const int dbVersion = 1;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  static Future<void> _createSchemas(Database db) async {
    await db.execute(createRulesTable);
  }

  static Future<void> _insertInitialData(Database db) async {
    for (final rule in rules) {
      await db.insert('rules', rule);
    }
  }

  static Future<Database> _initDb() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ref_mate.db');
    return await openDatabase(
      path,
      version: dbVersion,
      onCreate: (db, version) async {
        await _createSchemas(db);
        await _insertInitialData(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        await db.delete('rules');
        await _insertInitialData(db);
      },
    );
  }

  static Future close() async {
    final db = _db;
    if (db != null) {
      await db.close();
      _db = null;
    }
  }
}
