import 'package:flutter/material.dart';
import 'package:weatherapp/pages/search%20page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/bg.jpg"),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
                SizedBox(height: 25,),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.deepPurpleAccent,),
                    width:300 ,
                    padding: EdgeInsets.all(16),
                    
                    child: Center(
                      child: Text("Enter the Application",style: TextStyle(color: Colors.white,fontSize: 25),)
                    ),
                  ),
                  onTap: () => Navigator.push( context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
