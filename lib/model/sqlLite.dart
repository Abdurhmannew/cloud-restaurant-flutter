import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; // Import the path package

class MySQLite {
  Future<Database> initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "laui.db");

    // Open the database and call onCreate if it's being created for the first time
    Database mysql = await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
    return mysql;
  }

  // Function to create the database structure
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE example_table (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      )
    ''');
  }
}
