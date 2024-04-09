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
  TextEditingController _passwordTextController =TextEditingController();
  TextEditingController _emailTextController =TextEditingController();
  bool _passwordVisible= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "Task Manager",
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white70,
          fontFamily: 'YoungSerif',
        ),
      ),
    ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
          Colors.black38,
          Colors.purpleAccent,
          Colors.blueGrey

        ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        ),),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 130,
                ),
                Icon(Icons.check_circle, size: 280, color: Colors.grey.shade300,),
                // Image(
                //   image: AssetImage(
                //       ""),
                //   width: 300,
                //   height: 310,
                // ),
                SizedBox(
                  height: 80,
                ),
                reusableTextField("Email Address", Icons.email_outlined, false, _emailTextController),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: reusableTextField(
                              "Password", Icons.lock_outline_rounded, _passwordVisible, _passwordTextController),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
              SizedBox(
                width: double.infinity, // Set width to match parent width
                height: 50, // Set desired height
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  style: ElevatedButton.styleFrom(
                    // Adjust padding if needed
                    padding: EdgeInsets.all(13),
                  ),
                  child: Text(
                    'Log In',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Row signupOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.black,fontSize: 17.0)),

        GestureDetector(
          onTap:() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
          } ,
          child: const Text(" Sign Up",
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                fontSize: 17.0),
          ),
        )
      ],
    );
  }
}
