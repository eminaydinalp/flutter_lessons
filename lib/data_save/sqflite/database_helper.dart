import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static Database? _database;
  static const String databaseName = "restaurant.db";
  static const String tableName = "menu";

  Future<Database> get database async {
    if(_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database?> _initDB() async {

    String dbPath = await getDatabasesPath();
    String path = join(dbPath, databaseName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async{

        await db.execute(
          '''
          CREATE TABLE $tableName (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          price REAL,
          description TEXT
          )
          '''
        );
      }
    );

  }

  // CRUD

  // CREATE

  Future<int> insertItem(Map<String, dynamic> item) async {
    Database db = await database;
    return await db.insert(tableName, item);
  }

  // READ

  Future<List<Map<String, dynamic>>> getItems() async {
    Database db = await database;
    return await db.query(tableName, orderBy: 'id DESC');
  }

  // UPDATE

  Future<int> updateItem(Map<String, dynamic> item) async {
    Database db = await database;

    return await db.update(
      tableName,
      item,
      where: 'id = ?',
      whereArgs: [item['id']],
    );
  }

  // DELETE

  Future<int> deleteItem(int id) async {
    Database db = await database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

}