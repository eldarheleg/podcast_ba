import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:podcast_ba/app/data/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Database? _db;

  static const String db_name = 'database.db';
  static const String table_users = 'users';
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
    String path = join(databasesPath, db_name);
    var db = await openDatabase(path, version: version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute(
      '''
      CREATE TABLE $table_users (id INTEGER PRIMARY KEY,$firstName TEXT,$lastName TEXT,$email TEXT,$password TEXT)''',
    );
  }

  Future<int> saveData(User user) async {
    var dbClient = await db;
    var res = await dbClient!.insert(table_users, user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  Future<User?> getLoginUser(String email, String password) async {
    var dbClient = await db;
    var res = await dbClient!.query('users',
        where: 'email = ? AND password = ?', whereArgs: [email, password]);
    if (res.isNotEmpty) {
      return User.fromJson(res.first);
    }

    return null;
  }

  Future<int> updateUser(User user) async {
    var dbClient = await db;
    var res = await dbClient!.update(table_users, user.toJson(),
        where: '$email = ?', whereArgs: [user.email]);
    return res;
  }

  Future<int> deleteUser(String email) async {
    var dbClient = await db;
    var res = await dbClient!
        .delete(table_users, where: '$email = ?', whereArgs: [email]);
    return res;
  }
}
