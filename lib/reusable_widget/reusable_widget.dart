import 'package:flutter/material.dart';

Image logoWidget(String imagename){
  return Image.asset(
    imagename,
    fit: BoxFit.fitWidth,
    width: 272,
    height: 451,
    color: Colors.black54,
  );
}
//
// TextField reusableTextField(String text, IconData icon, isPasswordType, TextEditingController controller){
//   return TextField(
//     controller: controller,
//     obscureText: isPasswordType,
//     enableSuggestions: !isPasswordType,
//     autocorrect: !isPasswordType,
//     cursorColor: Colors.white,
//     style: TextStyle(color: Colors.black.withOpacity(0.9)),
//     decoration:
//     InputDecoration(
//       prefixIcon: Icon(
//         icon,
//         color: Colors.white70,
//       ),
//       labelText: text,
//       labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
//       filled: true,
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//       fillColor: Colors.black.withOpacity(0.3),
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.0),
//           borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
//     ),
//     keyboardType: isPasswordType
//         ? TextInputType.visiblePassword
//         : TextInputType.emailAddress,
//   );
// }


TextField reusableTextField(String text, IconData icon, bool isPasswordType, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black38,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.black.withOpacity(0.3),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white), // Set the color of the line
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}


Container signInSignUpButton( BuildContext context, bool isLogin, Function onTap){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 65,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(

      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? 'LOG IN ' : ' SIGN UP ',
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16
        ),
      ),
      style :
      ButtonStyle(

          backgroundColor: MaterialStateProperty.resolveWith((states){
            if(states.contains(MaterialState.pressed)){
              return Colors.black26;
            }
            return Colors.deepPurpleAccent;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(

              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)))),
    ),
  );
}