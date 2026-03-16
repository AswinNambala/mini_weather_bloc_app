import 'package:weather_bloc_app/models/weather_class.dart';
import 'package:weather_bloc_app/service/api_service.dart';

class WeatherRepository {
  ApiServices apiServices = ApiServices();
  WeatherRepository(this.apiServices);
  Future<WeatherClass> fetchWeatherData(String city) {
    return apiServices.getWeatherData(city);
  }

  Future<void> sendCity(String city) {
    return apiServices.postSearchCity(city);
  }
}
