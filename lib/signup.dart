import 'package:flutter/material.dart';
import 'package:todo/auth.dart';
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
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),

      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black38,
                Colors.purpleAccent,
                Colors.blueGrey
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
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
                        Text("Welcome!",
                          style: TextStyle(
                            color: Colors.greenAccent.shade200,
                            fontSize: 37,
                            fontFamily: 'YoungSerif',

                          ),),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
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
                                color: Colors.white,
                              ),
                              hintText: 'Enter Username*',
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.9)),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
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
                                color: Colors.white,
                              ),
                              hintText: 'Enter E-mail*',
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.9)),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
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
                                color: Colors.white,
                              ),
                              hintText: 'Enter Password*',
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.9)),
                            ),
                            style: TextStyle(color: Colors.white),
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
                            // registration();
                          },
                          child: Center(
                            child: Container(
                              width: 150,
                              height: 55,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.black45,
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
                                  color: Colors.white,
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
                                    color: Colors.greenAccent,
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
      ),
    );
  }
}
