import 'package:weather_app/core/utils/converters.dart';

class WeatherForecastEntity {
  final CurrentForecastEntity current;
  final List<HourlyForecastEntity> hourly;
  final List<DailyForecastEntity> daily;

  WeatherForecastEntity({
    required this.current,
    required this.hourly,
    required this.daily,
  });
}

class CurrentForecastEntity {
  final int dt;
  final int sunrise;
  final int sunset;
  final Temperature temperature;
  final Temperature feelsLike;
  final int pressure;
  final int humidity;
  final int uvIndex;
  final int visibility;
  final WindSpeed windSpeed;
  final WindDegrees windDeg;
  final List<WeatherEntity> weather;

  CurrentForecastEntity({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temperature,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.uvIndex,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.weather,
  });
}

class HourlyForecastEntity {
  final int dt;
  final Temperature temperature;
  final List<WeatherEntity> weather;

  HourlyForecastEntity({
    required this.dt,
    required this.temperature,
    required this.weather,
  });
}

class DailyForecastEntity {
  final int dt;
  final Temperature minTemperature;
  final Temperature maxTemperature;
  final List<WeatherEntity> weather;

  DailyForecastEntity(
      {required this.dt,
      required this.minTemperature,
      required this.maxTemperature,
      required this.weather});
}

class WeatherEntity {
  final int id;
  final String main;
  final String description;

  WeatherEntity({
    required this.id,
    required this.main,
    required this.description,
  });
}
