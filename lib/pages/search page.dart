import "package:flutter/material.dart";
import "package:weatherapp/pages/weather_page.dart";

class SearchPage extends StatefulWidget {

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
    TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/bg.jpg"),
            )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.deepPurpleAccent,
                height: 50,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Type In A city name",
                      icon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.deepPurpleAccent
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: GestureDetector(
                  onTap: () => Navigator.push( context,
                    MaterialPageRoute(builder: (context) => WeatherPage(cityname: controller.text))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Search",style:TextStyle(color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}