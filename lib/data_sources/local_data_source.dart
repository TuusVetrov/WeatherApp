import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/coordinates_model.dart';
import 'package:weather_app/models/weather_forecast_model.dart';

Future<void> saveLastUpdate() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('last_update', DateTime.now().millisecondsSinceEpoch);
}

Future<DateTime?> getLastUpdate() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final data = prefs.getInt('last_update');
  if (data != null && data > 0) {
    return DateTime.fromMillisecondsSinceEpoch(data);
  }
  return Future.value(null);
}

Future<CityInfoModel> getLastCityDataFromCache() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? jsonCityData = prefs.getString('CACHED_CITY_DATA');

  if (jsonCityData!.isEmpty) {}

  return Future.value(CityInfoModel.fromJson(
      json.decode(jsonCityData) as Map<String, dynamic>));
}

Future<void> weatherCityToCache(CityInfoModel cityData) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String jsonCityData = json.encode(cityData.toJson());

  prefs.setString('CACHED_CITY_DATA', jsonCityData);
}

Future<WeatherForecastModel> getLastWeatherDataFromCache() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? jsonWeatherForecast = prefs.getString('CACHED_WEATHER_DATA');

  if (jsonWeatherForecast!.isEmpty) {}

  return Future.value(WeatherForecastModel.fromJson(
      json.decode(jsonWeatherForecast) as Map<String, dynamic>));
}

Future<void> weatherDataToCache(WeatherForecastModel weatherData) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String jsonWeatherForecast = json.encode(weatherData.toJson());

  prefs.setString('CACHED_WEATHER_DATA', jsonWeatherForecast);
}
