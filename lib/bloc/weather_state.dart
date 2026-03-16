import 'package:equatable/equatable.dart';
import 'package:weather_bloc_app/models/weather_class.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherInital extends WeatherState {}

class WeatherLoading extends WeatherState {
 final double progress;
  WeatherLoading(this.progress);
}

class WeatherLoaded extends WeatherState {
  final WeatherClass weather;
  WeatherLoaded(this.weather);
  @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherState {
  final String message;
  final String city;
  WeatherError(this.message, this.city);
  @override
  List<Object> get props => [message];
}
