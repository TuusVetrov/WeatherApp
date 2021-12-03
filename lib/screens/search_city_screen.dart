import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_fonts_wrapper.dart';
import 'package:weather_app/widgets/search_city_screen/background.dart';

class SearchCityScreen extends StatefulWidget {
  const SearchCityScreen({Key? key}) : super(key: key);

  @override
  _SearchCityScreenState createState() => _SearchCityScreenState();
}

class _SearchCityScreenState extends State<SearchCityScreen> {
  late String _cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SearchBackgroundView(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(right: 34, left: 34, top: 60),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppFontsWrapper.textMedium(
                        'Location', 20, AppColors.textOnBackgroundColor),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  TextField(
                    autofocus: true,
                    style:
                        const TextStyle(color: Color.fromARGB(255, 107, 86, 253)),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          size: 30,
                          color: Color.fromARGB(255, 107, 86, 253),
                        ),
                        onPressed: () {
                          if (_cityName.isNotEmpty) {
                            Navigator.pop(context, _cityName);
                          }
                        },
                      ),
                      hintText: 'Enter city name',
                      hintStyle:
                          const TextStyle(color: Color.fromARGB(255, 107, 86, 253)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      _cityName = value;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}