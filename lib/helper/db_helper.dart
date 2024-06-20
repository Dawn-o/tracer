import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;

  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'tracertest.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE expense(id INTEGER PRIMARY KEY AUTOINCREMENT, item_name TEXT, item_price INTEGER, date_time TEXT)",
        );
      },
     
    );
  }

  Future<int> insertExpense(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('expense', row);
  }

  Future<List<Map<String, dynamic>>> queryAllExpense() async {
    Database db = await database;
    return await db.query('expense');
  }

  Future<int> updateExpense(Map<String, dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update('expense', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteExpense(int id) async {
    Database db = await database;
    return await db.delete('expense', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> totalTransaction(String status) async {
    Database db = await database;
    return Sqflite.firstIntValue(await db.query(
          'expense',
          columns: ['COUNT(*)'],
        )) ??
        0;
  }
}