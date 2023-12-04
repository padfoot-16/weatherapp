import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:weatherapp/services/weather_service.dart";

import "../models/weather_model.dart";

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //api key
  final _weatherservice =Weatherservice(apiKey:"73be32205d7989877f416f933980d669");
  Weather? _weather;
  //fetch weather
  _fetchWeather() async {
    String cityname= await _weatherservice.getCurrentCity();
    try {
      final weather= await _weatherservice.getWeather(cityname);
      setState(() {
        _weather= weather;
      });
    }

    catch(e){
      print(e);
    }
  }
  //weather animations
  String getWeatherannimation(String? mainCondition){
    if(mainCondition == null) return "lib/assets/sunny.json";

    switch(mainCondition.toLowerCase()){
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
      case 'clear': return 'lib/assets/sunny.json';
      default: return 'lib/assets/sunny.json';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(_weather?.cityName ?? "loading city .."),
          Lottie.asset(getWeatherannimation(_weather?.mainCondition)),
      
          Text("${_weather?.temp.round()} C"),
          Text(_weather?.mainCondition ?? ""),
        ]),
      ),
    );
  }
}