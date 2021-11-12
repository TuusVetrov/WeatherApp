import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:weather_app/data_sources/api/weather_api.dart';
import 'package:weather_app/screens/search_city_screen.dart';
import 'package:weather_app/widgets/weather_forecast_screen/background.dart';
import 'package:weather_app/widgets/weather_forecast_screen/current_weather.dart';
import 'package:weather_app/widgets/weather_forecast_screen/select_forecast.dart';
import 'package:weather_app/widgets/weather_forecast_screen/weather_forecast_item.dart';

class WeatherForecastScreen extends StatefulWidget {
  final AllWeatherData weatherData;

  const WeatherForecastScreen({required this.weatherData});

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late String _cityName;
  late Future<AllWeatherData> weatherForecast;

  @override
  void initState() {
    super.initState();

    weatherForecast = Future.value(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () async {
            final tappedCityName = await Navigator.push(
                context,
                MaterialPageRoute<String>(
                    builder: (context) => const SearchCityScreen()));
            setState(() {
              _cityName = tappedCityName!;
              weatherForecast =
                  WeatherApi().getWeatherData(cityName: _cityName);
            });
          },
        ),
      ),
      body: FutureBuilder<AllWeatherData>(
        future: weatherForecast,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                BackgroundView(
                  snapshot: snapshot,
                  scaleFactor: 0.66,
                ),
                CurrentWeatherView(
                  snapshot: snapshot,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 572),
                  child: SelectForecastView(
                    snapshot: snapshot,
                  ),
                ),
              ],
            );
          } else {
            return const Center(
                child: SpinKitFadingCircle(
              color: Colors.black,
            ));
          }
        },
      ),
    );
  }
}
