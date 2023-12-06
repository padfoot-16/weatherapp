// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
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
  String getWeatherannimation(String? mainCondition) {
    if (mainCondition == null) return "lib/assets/sunny.json";

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'lib/assets/cloud.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'lib/assets/rain.json';
      case 'thunderstorm':
        return 'lib/assets/thunder.json';
      case 'clear':
        return 'lib/assets/sunny.json';
      default:
        return 'lib/assets/sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
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
                Colors.deepPurple,
                Colors.deepPurpleAccent.shade100,
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 280,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0, 0.8],
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Colors.purple.shade200,
                            Colors.deepPurpleAccent,
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  Text(
                                      now.hour.toString() +
                                          ":" +
                                          now.minute.toString() +
                                          ":" +
                                          now.second.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25)),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "${_weather?.temp.round()} C",
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
                                  Icon(
                                    Icons.calendar_month,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                      now.day.toString() +
                                          "/" +
                                          now.month.toString() +
                                          "/" +
                                          now.year.toString(),
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
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                          stops: [0, 0.8],
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Colors.purple.shade200,
                            Colors.deepPurpleAccent,
                          ],
                        ),
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
