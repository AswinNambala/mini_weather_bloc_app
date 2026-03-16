class WeatherClass {
  final String city;
  final double temperature;
  final int humidity;
  final int dateTime;
  final double windSpeed;
  final String description;
  final int pressure;
  WeatherClass(
      {required this.city,
      required this.pressure,
      required this.dateTime,
      required this.humidity,
      required this.windSpeed,
      required this.temperature,
      required this.description});
  factory WeatherClass.fromJson(Map<String, dynamic> json) {
    return WeatherClass(
        city: json['name'],
        pressure: json['main']['pressure'],
        temperature: json['main']['temp'].toDouble(),
        description: json['weather'][0]['description'],
        dateTime: json['dt'],
        humidity: json['main']['humidity'],
        windSpeed: json['wind']['speed'].toDouble());
  }
}
