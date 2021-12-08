import 'package:weather_app/core/utils/converters.dart';
import 'package:weather_app/entitys/weather_forecast_entity.dart';

class WeatherForecastModel extends WeatherForecastEntity {
  WeatherForecastModel({
    required CurrentForecastModel current,
    required List<HourlyForecastModel> hourly,
    required List<DailyForecastModel> daily,
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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'current': current.toJson(),
      'hourly':
          hourly.map((HourlyForecastModel value) => value.toJson()).toList(),
      'daily': daily.map((DailyForecastModel value) => value.toJson()).toList(),
    };
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
    required List<WeatherModel> weather,
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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'dt': dt,
      'feels_like': feelsLike.getAs(unit: TemperatureUnit.kelvin),
      'humidity': humidity,
      'pressure': pressure,
      'sunrise': sunrise,
      'sunset': sunset,
      'temp': temperature.getAs(unit: TemperatureUnit.kelvin),
      'uvi': uvIndex,
      'visibility': visibility,
      'weather': weather.map((WeatherModel value) => value.toJson()).toList(),
      'wind_deg': windDeg.getAs(unit: WindDegreesUnit.degrees),
      'wind_speed': windSpeed.getAs(unit: WindSpeedUnit.meterSec),
    };
  }
}

class HourlyForecastModel extends HourlyForecastEntity {
  HourlyForecastModel({
    required int dt,
    required Temperature temperature,
    required List<WeatherModel> weather,
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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'dt': dt,
      'temp': temperature.getAs(unit: TemperatureUnit.kelvin),
      'weather': weather.map((WeatherModel value) => value.toJson()).toList(),
    };
  }
}

class DailyForecastModel extends DailyForecastEntity {
  DailyForecastModel({
    required int dt,
    required TempDailyModel tempDaily,
    required List<WeatherModel> weather,
  }) : super(dt: dt, tempDaily: tempDaily, weather: weather);

  factory DailyForecastModel.fromJson(Map<String, dynamic> json) {
    return DailyForecastModel(
      dt: json['dt'] as int,
      tempDaily: TempDailyModel.fromJson(json['temp'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((dynamic e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'dt': dt,
      'temp': tempDaily.toJson(),
      'weather': weather.map((WeatherModel value) => value.toJson()).toList(),
    };
  }
}

class TempDailyModel extends TempDailyEntity {
  TempDailyModel({
    required Temperature minTemperature,
    required Temperature maxTemperature,
  }) : super(
          minTemperature: minTemperature,
          maxTemperature: maxTemperature,
        );

  factory TempDailyModel.fromJson(Map<String, dynamic> json) {
    return TempDailyModel(
      minTemperature: Temperature(jsonToDouble(json['min'])),
      maxTemperature: Temperature(jsonToDouble(json['max'])),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'min': minTemperature.getAs(unit: TemperatureUnit.kelvin),
      'max': maxTemperature.getAs(unit: TemperatureUnit.kelvin),
    };
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
