import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/home.dart';
import 'package:todo/reusable_widget/reusable_widget.dart';
import 'package:todo/signup.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();


  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Login was successful, navigate to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } catch (e) {
      print('Login failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(

          backgroundColor: Colors.red,
          content: Text('Wrong credentials'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }


  bool _passwordVisible = false;
  bool _savePassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Set app bar color to transparent
        elevation: 0, // Remove app bar shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Back',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 185),
                Icon(Icons.assignment, color: Colors.deepPurpleAccent),
                SizedBox(width: 5),
                Text(
                  'TaskIO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.white, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 150,
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Log in your account & Manage',
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black38
                    ),
                  ),
                ),
                SizedBox(height: 1,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'your task',
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black38
                    ),
                  ),
                ),
                // Image(
                //   image: AssetImage(
                //       ""),
                //   width: 300,
                //   height: 310,
                // ),
                SizedBox(
                  height: 60,
                ),
                reusableTextField("Username ", Icons.person_2_outlined, false,
                    _emailTextController),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: reusableTextField(
                              "Password",
                              Icons.lock_outline_rounded,
                              _passwordVisible,
                              _passwordTextController),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(_passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 34,),
                Row(
                  children: [
                    const Text(
                      'Save password',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.green),
                    ),
                    Spacer(),
                    Switch(
                      value: _savePassword,
                      activeColor: Colors.green, // Set the color to green when switch is on
                      onChanged: (bool newValue) {
                        setState(() {
                          _savePassword = newValue; // Update the state of the switch
                        });
                      },
                    ),
                  ],
                ),

                SizedBox(
                  height: 40,
                ),
                signInSignUpButton(context, true, () {
                  loginWithEmailAndPassword(
                      _emailTextController.text, _passwordTextController.text);
                }),

                signupOption()

              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signupOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.black26),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(color: Colors.black, fontSize: 17.0),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: const Text(
                  " Sign Up",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

  }
}
