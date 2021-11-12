import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_colors.dart';

class SearchBackgroundView extends StatelessWidget {
  const SearchBackgroundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: AppColors.dayGradientColor,
      )),
    );
  }
}
