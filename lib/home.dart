// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:todo/data/database.dart';
// import 'package:todo/utils/dialog_box.dart';
// import 'package:todo/utils/todo_tile.dart';
//
//
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   // reference the hive box
//   final _myBox = Hive.box('mybox');
//   ToDoDataBase db = ToDoDataBase();
//
//   @override
//   void initState() {
//     // if this is the 1st time ever openin the app, then create default data
//     if (_myBox.get("TODOLIST") == null) {
//       db.createInitialData();
//     } else {
//       // there already exists data
//       db.loadData();
//     }
//
//     super.initState();
//   }
//
//   // text controller
//   //final _controller = TextEditingController();
//   final _titleController = TextEditingController();
//   final _descriptionController = TextEditingController();
//
//   // checkbox was tapped
//   void checkBoxChanged(bool? value, int index) {
//     setState(() {
//       db.toDoList[index][2] = !db.toDoList[index][2];
//       // db.toDoList[index]["completed"] = value;
//     });
//     db.updateDataBase();
//   }
//
//   // save new task
//   // void saveNewTask() {
//   //   setState(() {
//   //     db.toDoList.add([_controller.text, false]);
//   //     _controller.clear();
//   //   });
//   //   Navigator.of(context).pop();
//   //   db.updateDataBase();
//   // }
//
//   void saveNewTask() {
//     setState(() {
//       db.toDoList.add([
//         _titleController.text,
//         _descriptionController.text,
//         false,]);
//       _titleController.clear();
//       _descriptionController.clear();
//     });
//     Navigator.of(context).pop();
//     db.updateDataBase();
//   }
//
//
//   // create a new task
//   void createNewTask() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return DialogBox(titleController: _titleController, descriptionController: _descriptionController, onSave: saveNewTask, onCancel: () => Navigator.of(context).pop(),);
//         // return DialogBox(
//         //   controller: _controller,
//         //   onSave: saveNewTask,
//         //   onCancel: () => Navigator.of(context).pop(),
//         // );
//       },
//     );
//   }
//
//   // delete task
//   void deleteTask(int index) {
//     setState(() {
//       db.toDoList.removeAt(index);
//     });
//     db.updateDataBase();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.yellow[200],
//       appBar: AppBar(
//         title: Text('TO DO'),
//         elevation: 0,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: createNewTask,
//         child: Icon(Icons.add),
//       ),
//       body: ListView.builder(
//         itemCount: db.toDoList.length,
// //         itemBuilder: (context, index) {
// //           return ToDoTile(taskTitle: _titleController.text, taskDescription: _descriptionController.text, taskCompleted: db.toDoList[index]["completed"],
// //             onChanged: (value) => checkBoxChanged(value, index),
// //             deleteFunction: (context) => deleteTask(index),);
// // //           return ToDoTile(
// // //             taskName: db.toDoList[index][0],
// // //             taskCompleted: db.toDoList[index][1],
// // //             onChanged: (value) => checkBoxChanged(value, index),
// // //             deleteFunction: (context) => deleteTask(index),
// // //
// // //            // titleController: _titleController,
// // // //           descriptionController: _descriptionController,
// // // //           onSave: saveNewTask,
// // // //           onCancel: () => Navigator.of(context).pop(),
// // //           );
// //         },
//         itemBuilder: (context, index) {
//           //final task = db.toDoList[index];
//           return ToDoTile(taskName:  db.toDoList[index][0], taskDescription:  db.toDoList[index][1], taskCompleted:  db.toDoList[index][2], onChanged: (value) => checkBoxChanged(value, index), deleteFunction: (context) => deleteTask(index),);
//           // return ToDoTile(taskName: db.toDoList[index][0],
//           //             taskCompleted: db.toDoList[index][1],
//           //             onChanged: (value) => checkBoxChanged(value, index),
//           //             deleteFunction: (context) => deleteTask(index),
//           // );
//         },
//
//       ),
//     );
//   }
// }










///////////












import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/utils/dialog_box.dart';
import 'package:todo/utils/todo_tile.dart';
import '../data/database.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }

  // text controller
  final _controller = TextEditingController();
  final _descController = TextEditingController();

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][2] = !db.toDoList[index][2];
    });
    db.updateDataBase();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, _descController.text, false]);
      _controller.clear();
      _descController.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          descController: _descController,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.shade100,
        title: Text(
            'TO DO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 25,
            color: Colors.yellowAccent
          ),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskDesc: db.toDoList[index][1],
            taskCompleted: db.toDoList[index][2],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
//
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:todo/data/database.dart';
// import 'package:todo/utils/dialog_box.dart';
// import 'package:todo/utils/todo_tile.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final _myBox = Hive.box('mybox');
//   ToDoDataBase db = ToDoDataBase();
//   final _titleController = TextEditingController();
//   final _descriptionController = TextEditingController(); // New controller for description
//
//   @override
//   void initState() {
//     if (_myBox.get("TODOLIST") == null) {
//       db.createInitialData();
//     } else {
//       db.loadData();
//     }
//     super.initState();
//   }
//
//   void checkBoxChanged(bool? value, int index) {
//     setState(() {
//       db.toDoList[index]["completed"] = value;
//     });
//     db.updateDataBase();
//   }
//
//   void saveNewTask() {
//     setState(() {
//       db.toDoList.add({
//         "title": _titleController.text,
//         "description": _descriptionController.text,
//         "completed": false,
//       });
//       _titleController.clear();
//       _descriptionController.clear(); // Clear description controller as well
//     });
//     Navigator.of(context).pop();
//     db.updateDataBase();
//   }
//
//   void createNewTask() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return DialogBox(
//           titleController: _titleController,
//           descriptionController: _descriptionController,
//           onSave: saveNewTask,
//           onCancel: () => Navigator.of(context).pop(),
//         );
//       },
//     );
//   }
//
//   void deleteTask(int index) {
//     setState(() {
//       db.toDoList.removeAt(index);
//     });
//     db.updateDataBase();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.yellow[200],
//       appBar: AppBar(
//         title: Text('TO DO'),
//         elevation: 0,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: createNewTask,
//         child: Icon(Icons.add),
//       ),
//       body: ListView.builder(
//         itemCount: db.toDoList.length,
//         itemBuilder: (context, index) {
//           return ToDoTile(
//             taskTitle: db.toDoList[index]["title"],
//             taskDescription: db.toDoList[index]["description"],
//             taskCompleted: db.toDoList[index]["completed"],
//             onChanged: (value) => checkBoxChanged(value, index),
//             deleteFunction: (context) => deleteTask(index),
//           );
//         },
//       ),
//     );
//   }
// }
