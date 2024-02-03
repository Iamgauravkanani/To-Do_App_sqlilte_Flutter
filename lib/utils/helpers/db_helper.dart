import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../screens/home/model/todo_model.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  static Database? database;

  //TODO:table componennts
  String table_name = 'todo';
  String id = 'id';
  String task = 'task';
  String time = 'time';
  String date = 'date';

  initDB() async {
    String path = await getDatabasesPath();
    String db_path = join(path, 'demo.db');

    database = await openDatabase(
      db_path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE IF NOT EXISTS $table_name($id INTEGER PRIMARY KEY AUTOINCREMENT,$task TEXT,$time TEXT,$date TEXT);";
        db.execute(query);
      },
    );
  }

  Future<int?> insertTodo({required TODO todo}) async {
    await initDB();
    String query = "INSERT INTO $table_name($task,$date,$time) VALUES(?,?,?);";
    List args = [todo.task, todo.date, todo.time];
    int? res = await database?.rawInsert(query, args);
    return res;
  }

  Future<List<TODO>?> fetchTask() async {
    await initDB();
    String query = "SELECT * FROM $table_name;";
    var list = await database?.rawQuery(query);
    List<TODO>? todo = list?.map((e) => TODO.fromDB(data: e)).toList();
    return todo;
  }

  Future<int?> deleteTask({required int d_id}) async {
    await initDB();
    String query = "DELETE FROM $table_name WHERE $id=?;";
    List args = [d_id];
    return database?.rawDelete(query, args);
  }
}
