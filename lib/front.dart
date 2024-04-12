import 'package:flutter/material.dart';
import 'package:todo/auth.dart';
import 'package:todo/auth_check_page.dart';
import 'package:todo/signup.dart';

class TaskIoHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Set app bar color to transparent
        elevation: 0, // Remove app bar shadow
        title: Row(
          children: [
            // Logo icon
            Icon(Icons.assignment, color: Colors.blue),
            SizedBox(width: 8), // Add some spacing between icon and title
            // Title text
            Text(
              'TaskIO',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image in the center
            Image.asset(
              'assets/task_front.png',
              width: 250,
              height: 250,
            ),
            SizedBox(height: 30), // Add spacing between image and buttons
            // Text with left alignment
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'SMART TASK',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(height: 1), // Add spacing between image and buttons
            // Text with left alignment
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'MANAGEMENT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),

            SizedBox(height: 10), // Add spacing between texts
            // Text with left alignment
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'This smart tool is designed to help you',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 1), // Add spacing between texts
            // Text with left alignment
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'better manage your task',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 70), // Add spacing between texts and buttons
            // Row of buttons
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Login button
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AuthPage()),
                        );

                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Colors.white// Set background color to blue
                      ),
                      child: Text('LOGIN',style: TextStyle(color: Colors.black),),
                    ),
                  ),
                ),
                SizedBox(height: 20), // Add spacing between buttons
                // Signup button
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor:Colors.deepPurple// Set background color to blue
                      ),
                      child: Text('SIGNUP', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
