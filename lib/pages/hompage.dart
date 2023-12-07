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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/bg.jpg"),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
                const SizedBox(height: 25,),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.deepPurpleAccent,),
                    width:300 ,
                    padding: const EdgeInsets.all(16),
                    
                    child: const Center(
                      child: Text("Enter the Application",style: TextStyle(color: Colors.white,fontSize: 25),)
                    ),
                  ),
                  onTap: () => Navigator.push( context,
                    MaterialPageRoute(builder: (context) => const SearchPage()),
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
