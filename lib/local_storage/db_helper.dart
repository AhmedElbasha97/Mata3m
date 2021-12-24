import 'dart:async';
import 'dart:io';
import 'package:mata3m/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const _DATA_BASE_NAME = "Mata3m.db";
  static const _DATA_BASE_VERSION = 1;
  static const _ENTTABLE = 'entering';
  static const COLUMN_ID = 'id';
  static const COLUMN_NAME = 'name';
  static const COLUMN_EMAIL = 'email';
  static const COLUMN_PASSWORRD = 'password';
  static const _locTABLE = 'locations';
  static const COLUMN_IDLOC = 'id';
  static const COLUMN_LOCATIONNAME = 'locationname';
  static const COLUMN_DES = 'description';
  static const COLUMN_RATING = 'rating';
  static const COLUMN_ZONE = 'zone';
  static const COLUMN_LOC = 'location';
  static const COLUMN_TYPE = 'type';
  static const COLUMN_IMAGES = 'images';
  static const _FAVTABLE = 'Fav';
  static const COLUMN_USERID = 'userid';
  static const COLUMN_LOCATIONID = 'locationid';
  static const COLUMN_LOCATIONAME = 'locationname';
  static const COLUMN_LOCTYPE = 'type';
  static const COLUMN_LOCZONE = 'ZONE';

  DbHelper._();
  static final DbHelper instance = DbHelper._();



  static Database _database = Database as Database;
//SeeIfTableIsCreatedOnDeviceOrNot
  Future<Database> get checkingUserTableIsCreatedInDatabase async {
    if (_database != null) return _database;
    _database = await _creatingUserTableInDatabase();
    return _database;
  }

  Future<Database> get checkingResTableIsCreatedInDatabase async {
    if (_database != null) return _database;
    _database = await _creatingResTableDatabase();
    return _database;
  }

  Future<Database> get checkinFavTableIsCreatedDatabase async {
    if (_database != null) return _database;
    _database = await _creatingFavTableDatabase();
    return _database;
  }
  // Creating table In data base
  Future<Database> _creatingUserTableInDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _DATA_BASE_NAME);
    return await openDatabase(path,
        version: _DATA_BASE_VERSION, onCreate: _onCreateENT);
  }

  Future<Database> _creatingResTableDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _DATA_BASE_NAME);
    return await openDatabase(path,
        version: _DATA_BASE_VERSION, onCreate: _onCreateRES);
  }

  Future<Database> _creatingFavTableDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _DATA_BASE_NAME);
    return await openDatabase(path,
        version: _DATA_BASE_VERSION, onCreate: _onCreateFav);
  }
//AddObjectToDataBaseTable
  Future _onCreateENT(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_ENTTABLE (
            $COLUMN_ID INTEGER PRIMARY KEY,
            $COLUMN_NAME TEXT,
            $COLUMN_EMAIL TEXT,
            $COLUMN_PASSWORRD TEXT
          )
          ''');
  }

  Future _onCreateRES(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_locTABLE (
            $COLUMN_IDLOC INTEGER PRIMARY KEY,
            $COLUMN_LOCATIONNAME TEXT,
            $COLUMN_RATING TEXT,
            $COLUMN_LOC TEXT,
            $COLUMN_TYPE TEXT,
            $COLUMN_DES TEXT,
            $COLUMN_ZONE TEXT,
            $COLUMN_IMAGES TEXT
          )
          ''');
  }

  Future _onCreateFav(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_FAVTABLE (
            $COLUMN_USERID INTEGER PRIMARY KEY,
            $COLUMN_LOCZONE TEXT,
            $COLUMN_LOCATIONID TEXT,
            $COLUMN_LOCATIONNAME TEXT,
            $COLUMN_LOCTYPE TEXT
          )
          ''');
  }

   Future<int> SignUp(Users user) async {
    int result = 0;
    final Database db = await _creatingUserTableInDatabase();
      result = await db.insert('users', user.toJson());
    return result;
  }

  Future<bool> signIn(String email, String password) async {
    var res = false;
    final Database db = await _creatingUserTableInDatabase();
   var users = await db.query(_ENTTABLE);
   for(var user  in users){
    user.forEach((key, value) {
      if(key == "email" && value == email){
        if(key == "password" && value == password){
          res = true;
        }
        res = false;
      }
    });
   }
   return res;
  }

  logOut (int id) async {
    final Database db = await _creatingUserTableInDatabase();
    await db.delete(
      'entering',
      where: "id = ?",
      whereArgs: [id],
    );
  }
//AddLoctionOrRestrauntToTableOfLoctions
  Future<int> inserloc(Map<String, dynamic> row) async {
    Database db =  await _creatingResTableDatabase();
    return await db.insert(_locTABLE, row,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
//AddItemToFavoriteTable
  Future<int> addToFav(favRes) async {
    int result = 0;
    final Database db = await _creatingUserTableInDatabase();
    result = await db.insert('Fav', favRes.toMap());
    return result;
  }
//removeItemToFavoriteTable
  removeFromFav (int id) async {
    final Database db = await _creatingUserTableInDatabase();
    await db.delete(
      'Fav',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}