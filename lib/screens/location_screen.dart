import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/data_sources/api/weather_api.dart';
import 'package:weather_app/screens/weather_forecast_screen.dart';
import 'package:weather_app/widgets/search_city_screen/background.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getLocationData() async {
    try {
      var weatherData = await WeatherApi().getWeatherData();

      Navigator.push(context,
          MaterialPageRoute<WeatherForecastScreen>(builder: (context) {
        return WeatherForecastScreen(
          weatherData: weatherData,
        );
      }));
    } catch (error) {
      log('$error');
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const[
           SearchBackgroundView(),
           Center(
              child: SpinKitFadingCircle(
            color: Colors.white,
          ))
        ],
      ),
    );
  }
}
