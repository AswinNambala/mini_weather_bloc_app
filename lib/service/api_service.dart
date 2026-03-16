import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_bloc_app/models/weather_class.dart';
import '../constant/utils.dart';

class ApiServices {
  Future<WeatherClass> getWeatherData(String city) async {
    final String url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherClass.fromJson(data);
    } else {
      throw Exception('failed to load weather data');
    }
  }

  Future<void> postSearchCity(String city) async {
    const String url = "https://jsonplaceholder.typicode.com/posts";
    await http.post(Uri.parse(url),
        body: jsonEncode({'city': city}),
        headers: {'Content-Type': 'application/json'});
  }
}
