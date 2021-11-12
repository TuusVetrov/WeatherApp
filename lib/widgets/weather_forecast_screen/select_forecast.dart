import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_fonts_wrapper.dart';
import 'package:weather_app/data_sources/api/weather_api.dart';
import 'package:weather_app/widgets/weather_forecast_screen/weather_forecast_item.dart';

class SelectForecastView extends StatefulWidget {
  final AsyncSnapshot<AllWeatherData> snapshot;

  SelectForecastView({required this.snapshot});

  @override
  State<SelectForecastView> createState() => _SelectForecastViewState();
}

class _SelectForecastViewState extends State<SelectForecastView> {
  int tab = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    tab = 0;
                  });
                },
                child: tab == 0
                    ? AppFontsWrapper.textBold(
                        'Today', 15, AppColors.textWithoutBackgroundColor)
                    : AppFontsWrapper.textMedium(
                        'Today', 15, AppColors.textWithoutBackgroundColor),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    tab = 1;
                  });
                },
                child: tab == 1
                    ? AppFontsWrapper.textBold(
                        'Daily', 15, AppColors.textWithoutBackgroundColor)
                    : AppFontsWrapper.textMedium(
                        'Daily', 15, AppColors.textWithoutBackgroundColor),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    tab = 2;
                  });
                },
                child: tab == 2
                    ? AppFontsWrapper.textBold(
                        'Details', 15, AppColors.textWithoutBackgroundColor)
                    : AppFontsWrapper.textMedium(
                        'Details', 15, AppColors.textWithoutBackgroundColor),
              ),
            ],
          ),
        ),
        const Divider(
          color: Color.fromARGB(255, 196, 196, 196),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 111,
            child: WeatherForecastItem(
              snapshot: widget.snapshot,
              tab: tab,
            ),
          ),
        ),
      ],
    );
  }
}
