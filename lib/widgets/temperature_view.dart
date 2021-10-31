import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_model.dart';

class TemperatureView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;
  const TemperatureView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
