import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_fonts_wrapper.dart';
import 'package:weather_app/core/utils/converters.dart';
import 'package:weather_app/data_sources/api/weather_api.dart';
import 'package:weather_app/entitys/weather_forecast_entity.dart';
import 'package:weather_app/models/weather_forecast_model.dart';

class WeatherForecastItem extends StatelessWidget {
  final AsyncSnapshot<AllWeatherData> snapshot;
  final int tab;

  const WeatherForecastItem(
      {Key? key, required this.snapshot, required this.tab})
      : super(key: key);

  Widget columnDataHourly(int dt, int sunset, Temperature temp, int iconId) {
    return Column(
      children: [
        AppFontsWrapper.textBold(
            getTime(dt), 12, AppColors.textWithoutBackgroundColor),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: SvgPicture.asset(
            weatherConditionMapper(sunset, iconId, true),
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: AppFontsWrapper.textBold(
              '${temp.getAs(unit: TemperatureUnit.celsius)}°',
              12,
              AppColors.textWithoutBackgroundColor),
        ),
      ],
    );
  }

  Widget columnDataDaily(
      int dt, int sunset, Temperature max, Temperature min, int iconId) {
    return Column(
      children: [
        AppFontsWrapper.textBold(
            getDay(dt), 12, AppColors.textWithoutBackgroundColor),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: SvgPicture.asset(
            weatherConditionMapper(sunset, iconId, true),
            color: Colors.grey,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppFontsWrapper.textBold(
                    '${max.getAs(unit: TemperatureUnit.celsius)}°',
                    12,
                    AppColors.textWithoutBackgroundColor),
                SizedBox(
                  width: 9,
                ),
                AppFontsWrapper.textBold(
                    '${min.getAs(unit: TemperatureUnit.celsius)}°',
                    12,
                    AppColors.textWithoutBackgroundColor),
              ],
            )),
      ],
    );
  }

  Widget detailItem(String name, String value) {
    return Column(
      children: [
        AppFontsWrapper.textMedium(
            name, 12, AppColors.textWithoutBackgroundColor),
        AppFontsWrapper.textBold(
            value, 12, AppColors.textWithoutBackgroundColor),
        const Divider(
          color: Color.fromARGB(255, 196, 196, 196),
        ),
      ],
    );
  }

  Widget columnDataDetail(CurrentForecastEntity data) {
    return Column(
      children: [
        const Divider(
          color: Color.fromARGB(255, 196, 196, 196),
        ),
        detailItem('Sunrise', getTime(data.sunrise)),
        detailItem('Sunset', getTime(data.sunset)),
        detailItem('Humidity', '${data.humidity}%'),
        detailItem('Wind',
            '${data.windDeg.getAs(unit: WindDegreesUnit.worldSides)} ${data.windSpeed.getAs(unit: WindSpeedUnit.meterSec)} m/s'),
        detailItem('Feels like',
            '${data.feelsLike.getAs(unit: TemperatureUnit.celsius)}°'),
        detailItem('Pressure', '${data.pressure} '),
        detailItem('Visibility', '${data.visibility} '),
        detailItem('UV-index', '${data.uvIndex} '),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var sunset = snapshot.data!.weatherForecastModel.current.sunset;
    var current = snapshot.data!.weatherForecastModel.current;
    var hourly = snapshot.data!.weatherForecastModel.hourly;
    var daily = snapshot.data!.weatherForecastModel.daily;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: ListView(
        padding: const EdgeInsets.only(top: 0),
        scrollDirection:
            (tab == 0 || tab == 1) ? Axis.horizontal : Axis.vertical,
        children: [
          if (tab == 0)
            for (var item in hourly)
              Padding(
                padding: const EdgeInsets.only(right: 32),
                child: columnDataHourly(
                    item.dt, sunset, item.temperature, item.weather[0].id),
              ),
          if (tab == 1)
            for (var item in daily)
              Padding(
                padding: const EdgeInsets.only(right: 32),
                child: columnDataDaily(item.dt, sunset, item.maxTemperature,
                    item.minTemperature, item.weather[0].id),
              ),
          if (tab == 2)
            Padding(
              padding: const EdgeInsets.only(right: 32),
              child: columnDataDetail(current),
            ),
        ],
      ),
    );
  }
}
