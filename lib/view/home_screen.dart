import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/bloc/weather_bloc.dart';
import 'package:weather_bloc_app/bloc/weather_event.dart';
import 'package:weather_bloc_app/constant/utils.dart';
import 'package:weather_bloc_app/view/weather_loading_screen.dart';
import 'package:weather_bloc_app/view/widget/snack_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchCtrl = TextEditingController();
  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        title:const Text(
          'Weather App',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
        ),
        backgroundColor: backGroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue[100], shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  Icons.cloudy_snowing,
                  size: 30,
                  color: Colors.blue[300],
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/mountain.png'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30, right: 15, left: 15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'City Name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: searchCtrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter City Names (e,g London, Kochi)',
                    prefixIcon:const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColors,
                      fixedSize: const Size(250, 70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: loading,
                    child:const Text(
                      '📍 Search Weather',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loading() {
    if (searchCtrl.text.isNotEmpty) {
      context.read<WeatherBloc>().add(FetchWeather(searchCtrl.text));
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) =>const WheatherLoading()));
    } else if (searchCtrl.text.isEmpty) {
      showGlassSnackBar(context, 'Error Identified',
          'Please enter any city name to see weather');
    }
  }
}
