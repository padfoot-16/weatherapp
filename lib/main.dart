import 'package:flutter/material.dart';
import 'package:weatherapp/pages/hompage.dart';
import 'package:weatherapp/pages/weather_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}