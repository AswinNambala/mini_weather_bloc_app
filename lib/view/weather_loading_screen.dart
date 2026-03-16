import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/bloc/weather_bloc.dart';
import 'package:weather_bloc_app/bloc/weather_state.dart';
import 'package:weather_bloc_app/constant/utils.dart';
import 'package:weather_bloc_app/view/weather_detail.dart';
import 'package:weather_bloc_app/view/weather_error.dart';

class WheatherLoading extends StatelessWidget {
  const WheatherLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text(
          'Weather App',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: backGroundColor,
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherLoaded) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => WeatherDetails(
                          weatherObject: state.weather,
                        )));
          }
          if (state is WeatherError) {
            log('loading page ${state.props.toString()}');
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => WeatherErrorScreen(
                          city: state.city,
                        )));
          }
        },
        builder: (context, state) {
          double progress = 0;
          if (state is WeatherLoading) {
            progress = state.progress;
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const  Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Icon(
                      Icons.cloud,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Fetching Weather Data...',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                ),
                const SizedBox(height: 10),
                Text("${(progress * 100).toInt()} %"),
              ],
            ),
          );
        },
      ),
    );
  }
}
