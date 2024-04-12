// import 'package:flutter/material.dart';
//
// class ToDoListProvider extends ChangeNotifier {
//   List<List<dynamic>> _toDoList = [];
//
//   List<List<dynamic>> get toDoList => _toDoList;
//
//   void updateToDoList(List<List<dynamic>> newList) {
//     _toDoList = newList;
//     notifyListeners();
//   }
// }


import 'package:flutter/material.dart';

class ToDoListProvider extends ChangeNotifier {
  List<List<dynamic>> _toDoList = [];

  List<List<dynamic>> get toDoList => _toDoList;

  void updateToDoList(List<List<dynamic>> newList) {
    _toDoList = newList;
    notifyListeners();
  }
}
