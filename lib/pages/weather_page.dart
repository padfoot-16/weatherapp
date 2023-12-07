// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import "package:weatherapp/services/weather_service.dart";

import "../models/weather_model.dart";

class WeatherPage extends StatefulWidget {
  final String cityname;
  const WeatherPage({super.key, required this.cityname});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  DateTime now = DateTime.now();
  //api key
  final _weatherservice =
      Weatherservice(apiKey: "73be32205d7989877f416f933980d669");
  Weather? _weather;
  //fetch weather
  _fetchWeather() async {
    try {
      final weather = await _weatherservice.getWeather(widget.cityname);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  //weather animations
  

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
                                     
        backgroundColor: Colors.purpleAccent,
        elevation: 0,
        leading:IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back)
      ) ,
       ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.purpleAccent,
                Colors.deepPurpleAccent.shade100,
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 280,
                      width: 380,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0, 0.8],
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Colors.purpleAccent.shade200,
                            Colors.deepPurpleAccent,
                          ],
                        ),
                        boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        )]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,top:20,bottom: 20),
                        child: SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.my_location_sharp, size: 35),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        _weather?.cityName ?? "loading city ..",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 25,),
                                  Text(
                                      "${now.hour}:${now.minute}:${now.second}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25)),
                                ],
                              ),
                              Column(
                                children: [
                                  
                                  Text(
                                    "${_weather?.temp.round()} °C",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(_weather?.mainCondition ?? "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25)),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 25,),
                                  Icon(
                                    Icons.calendar_month,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                      "${now.day}/${now.month}/${now.year}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 400,
                      width: 380,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0, 0.8],
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Colors.purpleAccent.shade200,
                            Colors.deepPurpleAccent,
                          ],
                        ),
                        boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        )]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.water_drop_outlined,size: 50,),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  children: [
                                    Text("Humidity",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 35)),
                                    Text("${_weather?.humidity} % ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25)),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.wind_power_outlined,size: 50),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  children: [
                                    Text("Wind Speed",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25)),
                                    Text("${_weather?.windSpeed}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25)),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.visibility_outlined,size: 50),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  children: [
                                    Text("Visibility",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25)),
                                    Text("${_weather?.visibility}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25)),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
      
                    // Text(_weather?.cityName ?? "loading city .."),
                    // Lottie.asset(getWeatherannimation(_weather?.mainCondition)),
      
                    // Text("${_weather?.temp.round()} C"),
                    // Text(_weather?.mainCondition ?? ""),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
