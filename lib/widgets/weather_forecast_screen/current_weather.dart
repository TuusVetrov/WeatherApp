import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_fonts_wrapper.dart';
import 'package:weather_app/core/utils/converters.dart';
import 'package:weather_app/data_sources/api/weather_api.dart';

class CurrentWeatherView extends StatelessWidget {
  final AsyncSnapshot<AllWeatherData> snapshot;

  const CurrentWeatherView({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Column(
            children: [
              const SizedBox(
                height: 9,
              ),
              AppFontsWrapper.textMedium(snapshot.data!.cityInfoModel.cityName,
                  34, AppColors.textOnBackgroundColor),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  SvgPicture.asset(weatherConditionMapper(
                      snapshot.data!.weatherForecastModel.current.sunset,
                      snapshot.data!.weatherForecastModel.current.weather[0].id,
                      false)),
                  Padding(
                    padding: const EdgeInsets.only(left: 11),
                    child: AppFontsWrapper.textBold(
                        '${snapshot.data!.weatherForecastModel.current.temperature.getAs(unit: TemperatureUnit.celsius)}°',
                        60,
                        AppColors.textOnBackgroundColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              AppFontsWrapper.textMedium(
                  snapshot.data!.weatherForecastModel.current.weather[0]
                      .description,
                  17,
                  AppColors.textOnBackgroundColor),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                      'assets/images/additional_icons/max_temp.svg'),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 31),
                    child: AppFontsWrapper.textMedium(
                        '${snapshot.data!.weatherForecastModel.daily[0].maxTemperature.getAs(unit: TemperatureUnit.celsius)}°',
                        17,
                        AppColors.textOnBackgroundColor),
                  ),
                  SvgPicture.asset(
                      'assets/images/additional_icons/min_temp.svg'),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: AppFontsWrapper.textMedium(
                        '${snapshot.data!.weatherForecastModel.daily[0].minTemperature.getAs(unit: TemperatureUnit.celsius)}°',
                        17,
                        AppColors.textOnBackgroundColor),
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
