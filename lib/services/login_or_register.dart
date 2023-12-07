// import 'package:flutter/material.dart';
// import '../pages/loginpage.dart';
// import '../pages/registerpage..dart';

// class LoginOrRegistre extends StatefulWidget {
//   const LoginOrRegistre({super.key});

//   @override
//   State<LoginOrRegistre> createState() => _LoginOrRegistreState();
// }

// class _LoginOrRegistreState extends State<LoginOrRegistre> {
//   bool showloginpage=true;

//   //toggle between pages
//   void togglepages(){
//     setState(() {
//       showloginpage=!showloginpage;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     if(showloginpage){
//       return LoginPage(onTap: togglepages);
//     }
//     else {
//       return RegisterPage(onTap: togglepages);
//     }
//   }
// }