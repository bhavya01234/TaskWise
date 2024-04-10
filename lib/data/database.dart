// import 'package:hive_flutter/hive_flutter.dart';
//
// class ToDoDataBase {
//   List toDoList = [];
//
//   // reference our box
//   final _myBox = Hive.box('mybox');
//
//   // run this method if this is the 1st time ever opening this app
//   void createInitialData() {
//     toDoList = [
//       ["Make Tutorial", false],
//       ["Do Exercise", false],
//     ];
//   }
//
//   // load the data from database
//   void loadData() {
//     toDoList = _myBox.get("TODOLIST");
//   }
//
//   // update the database
//   void updateDataBase() {
//     _myBox.put("TODOLIST", toDoList);
//   }
// }
















import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", "tutorial should be structured", false],
      ["Do Exercise", "workout should be mixed", false],
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}

// import 'package:hive_flutter/hive_flutter.dart';
//
// class ToDoDataBase {
//   List toDoList = [];
//
//   // Reference our box
//   final _myBox = Hive.box('mybox');
//
//   // Run this method if this is the 1st time ever opening this app
//   void createInitialData() {
//     toDoList = [
//       ["Make Tutorial","Write code examples", false],
//       ["Do Exercise", "30 minutes cardio", false],
//     ];
//   }
//
//   // Load the data from database
//   void loadData() {
//     toDoList = _myBox.get("TODOLIST");
//   }
//
//   // Update the database
//   void updateDataBase() {
//     _myBox.put("TODOLIST", toDoList);
//   }
// }
