// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/utils/converters.dart';
import 'package:weather_app/data_sources/api/weather_api.dart';

class BackgroundView extends StatelessWidget {
  final AsyncSnapshot<AllWeatherData> snapshot;

  const BackgroundView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height / 1.5),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: isDayTheme(snapshot.data!.weatherForecastModel.current.sunset,
                snapshot.data!.weatherForecastModel.current.sunrise)
            ? AppColors.dayGradientColor
            : AppColors.nightGradientColor,
      )),
    );
  }
}
