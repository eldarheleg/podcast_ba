import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:podcast_ba/app/data/models/user.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _db;
  Future<Database> get db async => _db ?? await initDb();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "podcast.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Users(id INTEGER PRIMARY KEY,firstname TEXT,lastname TEXT,email TEXT, password TEXT)");
    print("Table is created");
  }

  Future<List<User>> getAllUsers() async {
    Database db = await instance.db;
    var users = await db.query('users');
    List<User> usersList =
        users.isEmpty ? [] : users.map((e) => User.fromJson(e)).toList();
    print(usersList);
    return usersList;
  }

  Future<int> add(User user) async {
    Database db = await instance.db;
    return await db.insert('users', user.toJson());
  }
  // //insertion
  // Future<int> saveUser(User user) async {
  //   var dbClient = await db;
  //   print(user.name);
  //   int res = await dbClient.insert("User", user.toMap());
  //   List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
  //   print(list);
  //   return res;
  // }

  // //deletion
  // Future<int> deleteUser(User user) async {
  //   var dbClient = await db;
  //   int res = await dbClient.delete("User");
  //   return res;
  // }

  // Future<User> selectUser(User user) async {
  //   print("Select User");
  //   print(user.username);
  //   print(user.password);
  //   var dbClient = await db;
  //   List<Map> maps = await dbClient.query(tableUser,
  //       columns: [columnUserName, columnPassword],
  //       where: "$columnUserName = ? and $columnPassword = ?",
  //       whereArgs: [user.username, user.password]);
  //   print(maps);
  //   if (maps.length > 0) {
  //     print("User Exist !!!");
  //     return user;
  //   } else {
  //     return null;
  //   }
  // }
}
