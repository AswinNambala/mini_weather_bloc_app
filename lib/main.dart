import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/bloc/weather_bloc.dart';
import 'package:weather_bloc_app/respository/weather_respository.dart';
import 'package:weather_bloc_app/service/api_service.dart';
import 'package:weather_bloc_app/view/splash_screen.dart';

void main() {
  final repository = WeatherRepository(ApiServices());
  runApp(BlocProvider(
    create: (_) => WeatherBloc(repository),
    child: MyApp(repository),
  ));
}

class MyApp extends StatelessWidget {
  final WeatherRepository? repository;
  const MyApp(this.repository, {super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
