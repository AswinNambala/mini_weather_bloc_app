import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/bloc/weather_event.dart';
import 'package:weather_bloc_app/bloc/weather_state.dart';
import 'package:weather_bloc_app/respository/weather_respository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepository? repository;
  WeatherBloc(this.repository) : super(WeatherInital()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading(0.2));
      log('error form bloc .2 $event');
      await Future.delayed(const Duration(milliseconds: 300));
      emit(WeatherLoading(0.5));
      log('error form bloc .5 $event');
      try {
        final weather = await repository!.fetchWeatherData(event.city);
        emit(WeatherLoading(0.9));
        await Future.delayed(const Duration(milliseconds: 200));
        log('error form bloc .9 $event');
        await repository!.sendCity(event.city);
        emit(WeatherLoaded(weather));
        log('from bloc class ${weather.toString()}');
      } catch (e) {
        emit(WeatherError(e.toString(), event.city));
      }
    });
  }
}
