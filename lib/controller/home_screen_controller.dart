import 'package:sqflite/sqflite.dart';

class HomeScreenController {
  static late Database myDatabase;

  static Future initdb() async {
    // open the database
    myDatabase = await openDatabase("employeeData.db", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Employees (id INTEGER PRIMARY KEY, name TEXT, designation TEXT )');
    });
  }

  //.................................//

  static Future addEmployee() async {
    await myDatabase.rawInsert(
        'INSERT INTO Employees(name, designation) VALUES(?, ?)',
        ["vishnu", "flutter"]);

    getAllEmployee();
  }

//................................//
  static Future getAllEmployee() async {
    List<Map> employeeDataList =
        await myDatabase.rawQuery('SELECT * FROM employees ');
    print(employeeDataList);
  }

  removeEmployee() {}

  updateEmployee() {}
}
