// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:todo/auth.dart';
// import 'package:todo/projects.dart';
// import 'package:todo/utils/dialog_box.dart';
// import 'package:todo/utils/todo_tile.dart';
// import '../data/database.dart';
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
//   final _controller = TextEditingController();
//   final _descController = TextEditingController();
//   int _selectedIndex = 0;
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
//       db.toDoList[index][2] = !db.toDoList[index][2];
//     });
//     db.updateDataBase();
//   }
//
//   void saveNewTask() {
//     setState(() {
//       db.toDoList.add([_controller.text, _descController.text, false]);
//       _controller.clear();
//       _descController.clear();
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
//           controller: _controller,
//           descController: _descController,
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
//   void logout() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => SignInScreen()),
//     );
//   }
//
//   String _getFormattedDate() {
//     DateTime now = DateTime.now();
//     String month = _getMonthName(now.month);
//     return '$month ${now.day}, ${now.year}';
//   }
//
//   String _getMonthName(int month) {
//     switch (month) {
//       case 1:
//         return 'Jan';
//       case 2:
//         return 'Feb';
//       case 3:
//         return 'Mar';
//       case 4:
//         return 'Apr';
//       case 5:
//         return 'May';
//       case 6:
//         return 'Jun';
//       case 7:
//         return 'Jul';
//       case 8:
//         return 'Aug';
//       case 9:
//         return 'Sep';
//       case 10:
//         return 'Oct';
//       case 11:
//         return 'Nov';
//       case 12:
//         return 'Dec';
//       default:
//         return '';
//     }
//   }
//
//   Widget _buildGridBox(IconData icon, String text, Color color) {
//     return Container(
//       margin: EdgeInsets.all(10.0),
//       padding: EdgeInsets.all(10.0),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             top: 8.0,
//             right: 8.0,
//             child: Icon(
//               icon,
//               color: Colors.white,
//               size: 30,
//             ),
//           ),
//           Positioned(
//             bottom: 8.0,
//             left: 8.0,
//             child: Text(
//               text,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//
//     // Check if the Profile item is clicked (index 4)
//     if (index == 4) {
//       // Call the function to navigate to profile
//       navigateToProfile();
//     }
//   }
//
//   void navigateToProfile() {
//     // Navigate to the profile screen or execute any other logic
//     // For example:
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => Projects()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: Text(
//                     _getFormattedDate(),
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: Icon(
//                     Icons.calendar_today,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 130.0),
//                   child: IconButton(
//                     icon: Icon(Icons.search, color: Colors.black),
//                     onPressed: () {
//                       // Handle search action
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             PopupMenuButton(
//               itemBuilder: (BuildContext context) {
//                 return [
//                   PopupMenuItem(
//                     child: InkWell(
//                       onTap: logout,
//                       child: Text('Logout'),
//                     ),
//                   ),
//                 ];
//               },
//               icon: Icon(Icons.menu, color: Colors.black),
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'Today',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 24,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             GridView.count(
//               crossAxisCount: 2,
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               children: [
//                 _buildGridBox(Icons.loop, 'Ongoing', Colors.deepPurpleAccent),
//                 _buildGridBox(Icons.access_time, 'In Process', Colors.orangeAccent.shade100),
//                 _buildGridBox(Icons.assignment_turned_in, 'Complete', Colors.green.shade300),
//                 _buildGridBox(Icons.assignment_late_sharp, 'Cancel', Colors.redAccent),
//               ],
//             ),
//             SizedBox(height: 1),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextButton(
//                   onPressed: createNewTask,
//                   child: Text(
//                     'Add Task',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 Spacer(), // Add a spacer to push the icon to the right
//                 TextButton.icon(
//                   onPressed: createNewTask,
//                   icon: Icon(
//                     Icons.add,
//                     color: Colors.black,
//                   ),
//                   label: Text(''),
//                 ),
//                 Spacer(),
//                 TextButton(
//                   onPressed: (){},
//                   child: Text(
//                     'All tasks',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 Spacer(), // Add a spacer to push the icon to the right
//                 TextButton.icon(
//                   onPressed: (){},
//                   icon: Icon(
//                     Icons.keyboard_arrow_down_outlined,
//                     color: Colors.black,
//                   ),
//                   label: Text(''),
//                 ),
//               ],
//             ),
//             SizedBox(height: 0),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: db.toDoList.length,
//               itemBuilder: (context, index) {
//                 return ToDoTile(
//                   taskName: db.toDoList[index][0],
//                   taskDesc: db.toDoList[index][1],
//                   taskCompleted: db.toDoList[index][2],
//                   onChanged: (value) => checkBoxChanged(value, index),
//                   deleteFunction: (context) => deleteTask(index),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.white,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu_outlined, size: 35),
//             label: 'Menu',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.assignment, size: 35),
//             label: 'Document',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add_circle_outlined, size: 60, color: Colors.deepPurpleAccent,),
//             label: 'Add',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.arrow_right_alt_rounded, size: 35),
//             label: 'Send',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person, size: 35),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }











































import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/auth.dart';
import 'package:todo/projects.dart';
import 'package:todo/utils/dialog_box.dart';
import 'package:todo/utils/todo_tile.dart';
import '../data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();
  final _controller = TextEditingController();
  final _descController = TextEditingController();
  int _selectedIndex = 0;

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][2] = !db.toDoList[index][2];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, _descController.text, false]);
      _controller.clear();
      _descController.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

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

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void logout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }

  String _getFormattedDate() {
    DateTime now = DateTime.now();
    String month = _getMonthName(now.month);
    return '$month ${now.day}, ${now.year}';
  }

  Widget _buildGridBox(IconData icon, String text, Color color) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8.0,
            right: 8.0,
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          Positioned(
            bottom: 8.0,
            left: 8.0,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Check if the Profile item is clicked (index 4)
    if (index == 4) {
      // Call the function to navigate to profile
      navigateToProfile();
    }
  }

  void navigateToProfile() {
    // Navigate to the profile screen or execute any other logic
    // For example:
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Projects()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    _getFormattedDate(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 130.0),
                  child: IconButton(
                    icon: Icon(Icons.search, color: Colors.black),
                    onPressed: () {
                      // Handle search action
                    },
                  ),
                ),
              ],
            ),
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: InkWell(
                      onTap: logout,
                      child: Text('Logout'),
                    ),
                  ),
                ];
              },
              icon: Icon(Icons.menu, color: Colors.black),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Today',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildGridBox(Icons.loop, 'Ongoing', Colors.deepPurpleAccent),
                _buildGridBox(Icons.access_time, 'In Process', Colors.orangeAccent.shade100),
                _buildGridBox(Icons.assignment_turned_in, 'Complete', Colors.green.shade300),
                _buildGridBox(Icons.assignment_late_sharp, 'Cancel', Colors.redAccent),
              ],
            ),
            SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: createNewTask,
                  child: Text(
                    'Add Task',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Spacer(), // Add a spacer to push the icon to the right
                TextButton.icon(
                  onPressed: createNewTask,
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  label: Text(''),
                ),
                Spacer(),
                TextButton(
                  onPressed: (){},
                  child: Text(
                    'All tasks',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Spacer(), // Add a spacer to push the icon to the right
                TextButton.icon(
                  onPressed: (){},
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.black,
                  ),
                  label: Text(''),
                ),
              ],
            ),
            SizedBox(height: 0),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_outlined, size: 35),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment, size: 35),
            label: 'Document',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outlined, size: 60, color: Colors.deepPurpleAccent,),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_right_alt_rounded, size: 35),
            label: 'Send',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 35),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
