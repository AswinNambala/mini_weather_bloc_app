import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_bloc_app/constant/utils.dart';
import 'package:weather_bloc_app/models/weather_class.dart';
import 'package:weather_bloc_app/view/home_screen.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key, required this.weatherObject});
  final WeatherClass weatherObject;

  @override
  Widget build(BuildContext context) {
    final DateTime date =
        DateTime.fromMillisecondsSinceEpoch(weatherObject.dateTime * 1000);
    final formattedDate = DateFormat('EEEE, MMMM d').format(date);
    log('date is $date');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (ctx) => const HomePage()));
            },
            icon:const Icon(
              Icons.arrow_back_ios_new,
              size: 30,
            )),
        title: Text(
          weatherObject.city,
          style:const TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: backGroundColor,
      body: Padding(
        padding:const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formattedDate.toString(),
                style:const TextStyle(fontSize: 24, color: Colors.black54),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset('assets/cloud.png'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weatherObject.temperature.toString(),
                    style:const TextStyle(fontSize: 90, fontWeight: FontWeight.bold),
                  ),
                 const Text(
                    '° C',
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  )
                ],
              ),
              Text(
                weatherObject.description,
                style:const TextStyle(fontSize: 30, color: Colors.black54),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                     const BoxedIcon(
                        WeatherIcons.humidity,
                        size: 40,
                        color: Colors.blue,
                      ),
                    const Text(
                        'Humidity',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '${weatherObject.humidity.toString()}%',
                        style:const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                     const BoxedIcon(
                        WeatherIcons.strong_wind,
                        size: 40,
                        color: Colors.blue,
                      ),
                     const Text(
                        'Wind Speed',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '${weatherObject.humidity.toString()}%',
                        style:const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                     const BoxedIcon(
                        WeatherIcons.barometer,
                        size: 40,
                        color: Colors.blue,
                      ),
                     const Text(
                        'Pressure',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '${weatherObject.humidity.toString()}%',
                        style:const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
