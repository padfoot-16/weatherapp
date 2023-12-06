class Weather {
  final String cityName;
  final double temp;
  final String mainCondition;
  final int humidity;
  final double windSpeed;
  final int visibility;

  Weather({
    required this.cityName,
    required this.temp,
    required this.mainCondition,
    required this.humidity,
    required this.windSpeed,
    required this.visibility,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json["name"],
      temp: json["main"]["temp"].toDouble(),
      mainCondition: json["weather"][0]["main"],
      humidity: json["main"]["humidity"],
      windSpeed: json["wind"]["speed"].toDouble(),
      visibility: json["visibility"],
    );
  }
}
