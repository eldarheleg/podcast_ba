// Package imports:
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'package:podcast_ba/app/data/models/user.dart';

class DbHelper {
  static Database? _db;

  static const String dbName = 'database.db';
  static const String tableUsers = 'users';
  static const int version = 1;

  static const String firstName = 'firstname';
  static const String lastName = 'lastname';
  static const String email = 'email';
  static const String password = 'password';

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // String path = join(documentsDirectory.path, db_name);
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    var db = await openDatabase(path, version: version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute(
      '''
      CREATE TABLE $tableUsers (id INTEGER PRIMARY KEY,$firstName TEXT,$lastName TEXT,$email TEXT,$password TEXT)''',
    );
  }

  Future<int> saveData(User user) async {
    var dbClient = await db;
    var res = await dbClient!.insert(tableUsers, user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  Future<User?> getLoginUser(String email, String password) async {
    var dbClient = await db;
    var result = await dbClient!.query('users',
        where: 'email = ? AND password = ?', whereArgs: [email, password]);
    if (result.isNotEmpty) {
      return User.fromJson(result.first);
    }

    return null;
  }

  Future<bool> userExists(String email) async {
    var dbClient = await db;
    var result =
        await dbClient!.query('users', where: 'email = ?', whereArgs: [email]);
    return result.isNotEmpty;
  }

  Future<int> updateUser(User user) async {
    var dbClient = await db;
    var res = await dbClient!.update(tableUsers, user.toJson(),
        where: '$email = ?', whereArgs: [user.email]);
    return res;
  }

  Future<int> deleteUser(String email) async {
    var dbClient = await db;
    var res = await dbClient!
        .delete(tableUsers, where: '$email = ?', whereArgs: [email]);
    return res;
  }
}
