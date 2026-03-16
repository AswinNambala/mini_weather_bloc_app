import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/bloc/weather_bloc.dart';
import 'package:weather_bloc_app/bloc/weather_event.dart';
import 'package:weather_bloc_app/constant/utils.dart';
import 'package:weather_bloc_app/view/home_screen.dart';

class WeatherErrorScreen extends StatelessWidget {
  final String city;
  const WeatherErrorScreen({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        centerTitle: true,
        title:const Text(
          'Weather App',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient:const LinearGradient(
                    colors: [Colors.blue, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: Icon(
              Icons.location_off,
              color: Colors.blue[800],
              size: 90,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
         const Text(
            'City Not Found',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
         const Align(
            alignment: Alignment.center,
            child: Text(
                'Please try again. We couldn\'t find the location you were looking for.'),
          ),
          const SizedBox(
            height: 35,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColors,
                fixedSize: const Size(250, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                context.read<WeatherBloc>().add(FetchWeather(city));
              },
              child:const Text(
                'Retry',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColors,
                fixedSize: const Size(250, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (ctx) => const HomePage()));
              },
              child:const Text(
                'Cancel',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
        ],
      ),
    );
  }
}
