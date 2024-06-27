import 'package:Resepku/model/ShoppingList.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper{
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  final String tableName = 'shoppinglist';
  final String columnId = 'id';
  final String columnTitle = 'title';
  final String columnContent = 'content';

  DbHelper._internal();
  factory DbHelper() => _instance;

  Future<Database?> get _db  async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'shoppinglistdb');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async{
    var sql = "CREATE TABLE $tableName("
        "$columnId INTEGER PRIMARY KEY, "
        "$columnTitle TEXT,"
        "$columnContent TEXT)";
    await db.execute(sql);
  }

  Future<int?> saveShoppingList(Shoppinglist shoppinglist) async{
    var dbClient = await _db;
    return await dbClient!.insert(tableName, shoppinglist.toMap());
  }

  Future<List?> getAllShoppingList() async{
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [
      columnId,
      columnTitle,
      columnContent
    ]);

    return result.toList();
  }

  Future<int?> updateShoppingList(Shoppinglist shoppinglist) async{
    var dbClient = await _db;
    return await dbClient!.update(tableName, shoppinglist.toMap(), where: '$columnId = ?', whereArgs: [shoppinglist.id]);
  }

  Future<int?> deleteShoppingList(int id) async{
    var dbClient = await _db;
    return await dbClient!.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}