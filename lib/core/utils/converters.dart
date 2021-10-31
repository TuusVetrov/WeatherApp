enum TemperatureUnit { kelvin, celsius, fahrenheit }
enum WindSpeedUnit { meterSec, milesHour, kilometersHour }
enum WindDegreesUnit { degrees, worldSides }

class Temperature {
  final double _temperature; // by default use kelvin

  Temperature(this._temperature);

  int getAs({TemperatureUnit? unit}) {
    switch (unit) {
      case TemperatureUnit.kelvin:
        return _temperature.round();
      case TemperatureUnit.celsius:
        return (_temperature - 273.15).round();
      case TemperatureUnit.fahrenheit:
        return (_temperature * (9 / 5) - 459.67).round();
      default:
        return _temperature.round();
    }
  }
}

class WindSpeed {
  final double _windSpeed;

  WindSpeed(this._windSpeed);

  int getAs({WindSpeedUnit? unit}) {
    switch (unit) {
      case WindSpeedUnit.meterSec:
        return _windSpeed.round();
      case WindSpeedUnit.milesHour:
        return (_windSpeed * 2.237).round();
      case WindSpeedUnit.kilometersHour:
        return (_windSpeed * 3.6).round();
      default:
        return _windSpeed.round();
    }
  }
}

class WindDegrees {
  final double _windDegrees;

  static const List<String> compassSectorsEng = [
    'N',
    'NNE',
    'NE',
    'ENE',
    'E',
    'ESE',
    'SE',
    'SSE',
    'S',
    'SSW',
    'SW',
    'WSW',
    'W',
    'WNW',
    'NW',
    'NNW',
  ];

  static const List<String> compassSectorsRus = [
    'С',
    'ССВ',
    'СВ',
    'ВСВ',
    'В',
    'ВЮВ',
    'ЮВ',
    'ЮЮВ',
    'Ю',
    'ЮЮЗ',
    'ЮЗ',
    'ЗЮЗ',
    'З',
    'ЗСЗ',
    'СЗ',
    'ССЗ',
  ];

  WindDegrees(this._windDegrees);

  dynamic getAs({WindDegreesUnit? unit}) {
    switch (unit) {
      case WindDegreesUnit.degrees:
        return _windDegrees;
      case WindDegreesUnit.worldSides:
        int index = (_windDegrees + 11.25) ~/ 22.5;
        return compassSectorsEng[index % 16];
      default:
        return _windDegrees.round();
    }
  }
}

double jsonToDouble(dynamic value) {
  return value.toDouble() as double;
}
