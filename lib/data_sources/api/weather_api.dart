import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/utils/location.dart';
import 'package:weather_app/data_sources/local_data_source.dart';
import 'package:weather_app/models/coordinates_model.dart';

import 'package:weather_app/models/weather_forecast_model.dart';

class AllWeatherData {
  final CityInfoModel cityInfoModel;
  final WeatherForecastModel weatherForecastModel;

  AllWeatherData(
      {required this.cityInfoModel, required this.weatherForecastModel});
}

class WeatherApi {
  static const String _apiKey = '4d894ffc32ae5e364ba54281f7e7889a';

  Future<AllWeatherData> getWeatherData({String? cityName}) async {
    CityInfoModel location;
    WeatherForecastModel weatherData;

    var lastUpdate = await getLastUpdate();
    var currentTime = DateTime.now();

    if (lastUpdate != null &&
        currentTime.isBefore(lastUpdate.add(const Duration(minutes: 30))) &&
        cityName == null) {
      location = await getLastCityDataFromCache();
      weatherData = await getLastWeatherDataFromCache();
    } else {
      if (cityName == null) {
        location = await getCityInfo();
      } else {
        location = await getCityInfo(cityName: cityName);
      }

      await weatherCityToCache(location);

      weatherData = await getWeatherDataByLocation(
          location.coord.latitude, location.coord.longitude);

      await weatherDataToCache(weatherData);

      await saveLastUpdate();
    }

    return AllWeatherData(
        cityInfoModel: location, weatherForecastModel: weatherData);
  }

  Future<WeatherForecastModel> getWeatherDataByLocation(
      double latitude, double longitude) async {
    var queryParameters = {
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'appid': _apiKey,
      'exclude': 'minutely,alerts',
    };

    var url = Uri.https(
        'api.openweathermap.org', '/data/2.5/onecall', queryParameters);

    log('Request to ${url.toString()}');

    var response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error! response != 200');
    }

    log('Response :${response.body}');

    final infoJson = json.decode(response.body) as Map<String, dynamic>;

    return WeatherForecastModel.fromJson(infoJson);
  }

  Future<CityInfoModel> getCityInfo({String? cityName}) async {
    Map<String, String> queryParameters;

    // if we do not specify the name of the city, we take
    // the coordinates from the geolocator
    if (cityName == null) {
      Location location = Location();
      await location.getCurrentLocation();

      log('lat ${location.latitude} lon  ${location.longitude}');

      queryParameters = {
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
        'appid': _apiKey,
      };
    } else {
      queryParameters = {
        'q': cityName,
        'appid': _apiKey,
      };
    }

    var url = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    log('Request to ${url.toString()}');

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error! response != 200');
    }

    log('Response :${response.body}');

    final infoJson = json.decode(response.body) as Map<String, dynamic>;

    return CityInfoModel.fromJson(infoJson);
  }
}
