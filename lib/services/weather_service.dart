import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:http/http.dart' as http;

class Weatherservice {
  static const BASE_URL="https://openweathermap.org/api";
  final String apiKey;
  Weatherservice({required this.apiKey});
  
  Future<Weather>getWeather(String cityName)async{
    final response =await http.get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$apiKey&units=metric'));
    if (response.statusCode == 200){
      return Weather.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception('Failed to load Weather data');
    }
  }

  Future<String> getCurrentCity() async {
  // get permission
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }
  // fetch current location
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
  // convert location into a list of placemark objects
  List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);

  // extract the city name from the first placemark, if available
  String? city;
  if (placemarks.isNotEmpty) {
    city = placemarks.first.locality;
  }

  return city ?? "Unknown";
}
}