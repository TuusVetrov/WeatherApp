import 'package:weather_app/core/utils/converters.dart';
import 'package:weather_app/entitys/weather_forecast_entity.dart';

class WeatherForecastModel extends WeatherForecastEntity {
  WeatherForecastModel({
    required CurrentForecastEntity current,
    required List<HourlyForecastEntity> hourly,
    required List<DailyForecastEntity> daily,
  }) : super(
          current: current,
          hourly: hourly,
          daily: daily,
        );

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    return WeatherForecastModel(
      current: CurrentForecastModel.fromJson(
          json['current'] as Map<String, dynamic>),
      daily: (json['daily'] as List<dynamic>)
          .map((dynamic e) =>
              DailyForecastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hourly: (json['hourly'] as List<dynamic>)
          .map((dynamic e) =>
              HourlyForecastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class CurrentForecastModel extends CurrentForecastEntity {
  CurrentForecastModel({
    required int dt,
    required int sunrise,
    required int sunset,
    required Temperature temperature,
    required Temperature feelsLike,
    required int pressure,
    required int humidity,
    required int uvIndex,
    required int visibility,
    required WindSpeed windSpeed,
    required WindDegrees windDeg,
    required List<WeatherEntity> weather,
  }) : super(
          dt: dt,
          sunrise: sunrise,
          sunset: sunset,
          temperature: temperature,
          feelsLike: feelsLike,
          pressure: pressure,
          humidity: humidity,
          uvIndex: uvIndex,
          visibility: visibility,
          windSpeed: windSpeed,
          windDeg: windDeg,
          weather: weather,
        );

  factory CurrentForecastModel.fromJson(Map<String, dynamic> json) {
    return CurrentForecastModel(
      dt: json['dt'] as int,
      feelsLike: Temperature(jsonToDouble(json['feels_like'])),
      humidity: json['humidity'] as int,
      pressure: json['pressure'] as int,
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
      temperature: Temperature(jsonToDouble(json['temp'])),
      uvIndex: jsonToDouble(json['uvi']).round(),
      visibility: json['visibility'] as int,
      weather: (json['weather'] as List<dynamic>)
          .map((dynamic e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      windDeg: WindDegrees(jsonToDouble(json['wind_deg'])),
      windSpeed: WindSpeed(jsonToDouble(json['wind_speed'])),
    );
  }
}

class HourlyForecastModel extends HourlyForecastEntity {
  HourlyForecastModel({
    required int dt,
    required Temperature temperature,
    required List<WeatherEntity> weather,
  }) : super(
          dt: dt,
          temperature: temperature,
          weather: weather,
        );

  factory HourlyForecastModel.fromJson(Map<String, dynamic> json) {
    return HourlyForecastModel(
      dt: json['dt'] as int,
      temperature: Temperature(jsonToDouble(json['temp'])),
      weather: (json['weather'] as List<dynamic>)
          .map((dynamic e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DailyForecastModel extends DailyForecastEntity {
  DailyForecastModel({
    required int dt,
    required Temperature minTemperature,
    required Temperature maxTemperature,
    required List<WeatherEntity> weather,
  }) : super(
            dt: dt,
            minTemperature: minTemperature,
            maxTemperature: maxTemperature,
            weather: weather);

  factory DailyForecastModel.fromJson(Map<String, dynamic> json) {
    return DailyForecastModel(
      dt: json['dt'] as int,
      minTemperature: Temperature(jsonToDouble(json['temp']['min'])),
      maxTemperature: Temperature(jsonToDouble(json['temp']['max'])),
      weather: (json['weather'] as List<dynamic>)
          .map((dynamic e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required int id,
    required String main,
    required String description,
  }) : super(
          id: id,
          main: main,
          description: description,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      description: json['description'] as String,
      id: json['id'] as int,
      main: json['main'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description
    };
  }
}
