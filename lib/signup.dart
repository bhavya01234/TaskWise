import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/auth.dart';
import 'package:todo/home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email = "", password = "", name = "";
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController mailcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 20.0),
            )));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Changed title color to black
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white, // Set body background color to white
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 65.0, left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.0,
                      ),
                      Text(
                        "Welcome!",
                        style: TextStyle(
                          color: Colors.deepPurple, // Changed text color to deep purple
                          fontSize: 37,
                          fontFamily: 'YoungSerif',
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3), // Changed box color to grey
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextFormField(
                          controller: namecontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.person_2_outlined,
                              color: Colors.black, // Changed icon color to black
                            ),
                            hintText: 'Enter Username*',
                            hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.9)), // Changed hint color to black
                          ),
                          style: TextStyle(color: Colors.black), // Changed text color to black
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3), // Changed box color to grey
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextFormField(
                          controller: mailcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter E-mail';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.black, // Changed icon color to black
                            ),
                            hintText: 'Enter E-mail*',
                            hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.9)), // Changed hint color to black
                          ),
                          style: TextStyle(color: Colors.black), // Changed text color to black
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3), // Changed box color to grey
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.password_outlined,
                              color: Colors.black, // Changed icon color to black
                            ),
                            hintText: 'Enter Password*',
                            hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.9)), // Changed hint color to black
                          ),
                          style: TextStyle(color: Colors.black), // Changed text color to black
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = mailcontroller.text;
                              name = namecontroller.text;
                              password = passwordcontroller.text;
                            });
                          }
                          registration();
                        },
                        child: Center(
                          child: Container(
                            width: 150,
                            height: 55,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent.shade200,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "Signup",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Center the "Already Have Account?" and "Login" text
                      Center(
                        child: Column(
                          children: [
                            Text(
                              "Already Have Account?",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                " Login",
                                style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
