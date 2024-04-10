// import 'package:flutter/material.dart';
//
// import 'my_button.dart';
//
// class DialogBox extends StatelessWidget {
//   final controller;
//   VoidCallback onSave;
//   VoidCallback onCancel;
//
//   DialogBox({
//     super.key,
//     required this.controller,
//     required this.onSave,
//     required this.onCancel,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: Colors.yellow[300],
//       content: Container(
//         height: 120,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             // get user input
//             TextField(
//               controller: controller,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Add a new task",
//               ),
//             ),
//
//             // buttons -> save + cancel
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 // save button
//                 MyButton(text: "Save", onPressed: onSave),
//
//                 const SizedBox(width: 8),
//
//                 // cancel button
//                 MyButton(text: "Cancel", onPressed: onCancel),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final descController;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.descController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 190,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),

            TextField(
              controller: descController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a task description",
              ),
            ),

            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: "Save", onPressed: onSave),

                const SizedBox(width: 8),

                // cancel button
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
















//
// import 'package:flutter/material.dart';
//
// import 'my_button.dart';
//
// class DialogBox extends StatelessWidget {
//   final TextEditingController titleController;
//   final TextEditingController descriptionController; // New controller for description
//   VoidCallback onSave;
//   VoidCallback onCancel;
//
//   DialogBox({
//     super.key,
//     required this.titleController,
//     required this.descriptionController,
//     required this.onSave,
//     required this.onCancel,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: Colors.yellow[300],
//       content: Container(
//         height: 180,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             // Title input field
//             TextField(
//               controller: titleController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Add a new task title",
//               ),
//             ),
//
//             SizedBox(height: 8),
//
//             // Description input field
//             TextField(
//               controller: descriptionController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Add a task description",
//               ),
//             ),
//
//             SizedBox(height: 16),
//
//             // Buttons: Save and Cancel
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 // Save button
//                 MyButton(text: "Save", onPressed: onSave),
//
//                 SizedBox(width: 8),
//
//                 // Cancel button
//                 MyButton(text: "Cancel", onPressed: onCancel),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
