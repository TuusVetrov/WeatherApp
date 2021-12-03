// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/utils/converters.dart';
import 'package:weather_app/data_sources/api/weather_api.dart';

class BackgroundView extends StatelessWidget {
  final AsyncSnapshot<AllWeatherData> snapshot;
  final double scaleFactor;

  const BackgroundView({required this.snapshot, required this.scaleFactor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height * scaleFactor),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: compareCurrentTimeTo(
          snapshot.data!.weatherForecastModel.current.sunset,
        )
            ? AppColors.dayGradientColor
            : AppColors.nightGradientColor,
      )),
    );
  }
}
