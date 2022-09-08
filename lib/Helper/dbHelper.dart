
import 'package:kro/Model/kroModel.dart';
import 'package:kro/Model/userModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Model/TransactionModel.dart';

class DatabaseHelper {

static const _databaseName = "bank005.db";
static const _databaseVersion = 5;

static const usertable = 'users';
static const krotable = 'senders';
static const transactiontable = 'transactions';
// make this a singleton class
DatabaseHelper._privateConstructor();
static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

// only have a single app-wide reference to the database
var _database;
Future<Database> get database async {
if (_database != null) return _database;
// lazily instantiate the db the first time it is accessed
_database = await _initDatabase();
return _database;
}

// this opens the database (and creates it if it doesn't exist)
_initDatabase() async {
String path = join(await getDatabasesPath(), _databaseName);
return await openDatabase(path,
version: _databaseVersion,
onCreate: _onCreate);
}

// SQL code to create the database table
Future _onCreate(Database db, int version) async {
await db.execute('''
          CREATE TABLE $usertable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            phone TEXT NOT NULL,
            email TEXT NOT NULL,
            password TEXT NOT NULL,
            accountno TEXT NOT NULL,
            pincode TEXT NOT NULL,
            address TEXT NOT NULL,
            sortcode TEXT NOT NULL,
            balance TEXT NOT NULL
          )
          ''');
await db.execute('''
          CREATE TABLE $krotable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            surname TEXT NOT NULL,
            accountno TEXT NOT NULL,
            sortcode TEXT NOT NULL,
            senderid TEXT NOT NULL
           )
     
          ''');

await db.execute('''
          CREATE TABLE $transactiontable (
            id TEXT NOT NULL,
        status TEXT NOT NULL,
       amount TEXT NOT NULL,
        date TEXT NOT NULL,
       r_sortcode TEXT NOT NULL,
      s_sortcode TEXT NOT NULL,
       r_accountno TEXT NOT NULL,
       s_accountno TEXT NOT NULL,
       r_id TEXT NOT NULL,
       s_id TEXT NOT NULL,
       s_name TEXT NOT NULL,
       r_name TEXT NOT NULL,
       reference TEXT NOT NULL
            )
          ''');
}

// Helper methods

// Inserts a row in the database where each key in the Map is a column name
// and the value is the column value. The return value is the id of the
// inserted row.
Future<int> insert(UserModel user) async {
Database db = await instance.database;
return await db.insert(usertable,user.toMap());
}
  Future<int> insertKro(KroModel user) async {
    Database db = await instance.database;
    return await db.insert(krotable,user.toMap());
  }
  Future<int> inserttransaction(TransactionModel tr) async {
    Database db = await instance.database;
    return await db.insert(transactiontable,tr.toMap());
  }
// All of the rows are returned as a list of maps, where each map is
// a key-value list of columns.
Future<List<Map<String, dynamic>>> queryAllRows() async {
Database db = await instance.database;
return await db.query(usertable);
}

// Queries rows based on the argument received
Future<List<Map<String, dynamic>>> queryRows(email,password) async {
Database db = await instance.database;
List<Map<String, dynamic>> result = await db.rawQuery(
    'SELECT * FROM $usertable WHERE email=? and password=?',
    ['$email', '$password']
);
print(result.toString());
return result;
}
  Future<List<Map<String, dynamic>>> getBalance(email) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.rawQuery(
        'SELECT * FROM $usertable WHERE email=?',
        ['$email']
    );
    print(result.toString());
    return result;
  }
  Future<List<Map<String, dynamic>>> getKrolist(id) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.rawQuery(
        'SELECT * FROM $krotable WHERE senderid=?',
        ['$id']
    );
    print(result.toString());
    return result;
  }

  Future<List<Map<String, dynamic>>> getTRANslist(id) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.rawQuery(
        'SELECT * FROM $transactiontable WHERE s_id=?',
        ['$id']
    );
    print(result.toString());
    return result;
  }
// All of the methods (insert, query, update, delete) can also be done using
// raw SQL commands. This method uses a raw query to give the row count.
Future<int> queryRowCount() async {
Database db = await instance.database;
return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $usertable'));
}

// We are assuming here that the id column in the map is set. The other
// column values will be used to update the row.
Future<int> updateBalance(id,balance) async {

  try {
    Database db = await instance.database;
    var data = {
      "balance":balance.toString()
    };
    var d=await db.update(usertable, data, where: 'id= ?', whereArgs: [id]);

  }
catch(e){

  print(e.toString());}
  return 1;


}

// Deletes the row specified by the id. The number of affected rows is
// returned. This should be 1 as long as the row exists.
// Future<int> delete(int id) async {
// Database db = await instance.database;
// return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
// }
}