// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:messagingapp/services/auth/login_or_registre.dart';
// import 'package:weatherapp/pages/hompage.dart';

// import '../../pages/homepage.dart';

// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           //if user logged in 
//           if(snapshot.hasData){
//             return const HomePage();
//           }
//           //if user is not logged in
//           else{
//             return const LoginOrRegistre();
//           }
//         },
//       ),
//     );
//   }
// }