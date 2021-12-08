import 'package:intl/intl.dart';

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

DateTime getTimeForamted(int timeEpoch) {
  return DateTime.fromMillisecondsSinceEpoch(timeEpoch * 1000).toLocal();
}

String getTime(int dt) {
  return DateFormat('HH:mm')
      .format(DateTime.fromMillisecondsSinceEpoch(dt * 1000));
}

String getDay(int dt) {
  return DateFormat('EEE').format(getTimeForamted(dt).toLocal());
}

bool isDayTheme(int sunsetTimeEpoch, int sunriseTimeEpoch) {
  var currentTime = DateTime.now();
  var sunsetTime = DateTime.fromMillisecondsSinceEpoch(sunsetTimeEpoch * 1000);
  var sunriseTime =
      DateTime.fromMillisecondsSinceEpoch(sunriseTimeEpoch * 1000);

  print('Current: $currentTime Sunset: $sunsetTime Sunrise: $sunriseTime');
  print(
      '${currentTime.isAfter(sunsetTime)} ${currentTime.isAfter(sunsetTime)}');

  if (currentTime.isAfter(sunsetTime) && currentTime.isAfter(sunsetTime)) {
    return false;
  }

  return true;
}

// look at this dude)))
String weatherConditionMapper(
    int sunsetTimeEpoch, int sunriseTimeEpoch, int iconId, bool useSmallIcons) {
  var isDayTime = isDayTheme(sunsetTimeEpoch, sunriseTimeEpoch);

  // Thunderstorm
  if (iconId >= 200 && iconId <= 232) {
    if (!useSmallIcons) {
      return 'assets/images/main_icons/thunderstorm.svg';
    } else {
      return 'assets/images/small_icons/thunderstorm.svg';
    }
  }

  // ShowerRain
  if ((iconId >= 300 && iconId <= 321) || (iconId >= 520 && iconId <= 531)) {
    if (!useSmallIcons) {
      return 'assets/images/main_icons/shower_rain.svg';
    } else {
      return 'assets/images/small_icons/shower_rain.svg';
    }
  }

  // Rain
  if (iconId >= 500 && iconId <= 504) {
    if (!useSmallIcons) {
      return 'assets/images/main_icons/rain.svg';
    } else {
      return 'assets/images/small_icons/rain.svg';
    }
  }
  // Snow
  if ((iconId >= 600 && iconId <= 622) || iconId == 511) {
    if (!useSmallIcons) {
      return 'assets/images/main_icons/snow.svg';
    } else {
      return 'assets/images/small_icons/snow.svg';
    }
  }

  // Atmosphere
  if (iconId >= 701 && iconId <= 781) {
    if (!useSmallIcons) {
      return 'assets/images/main_icons/mist.svg';
    } else {
      return 'assets/images/small_icons/mist.svg';
    }
  }

  // Clear
  if (iconId == 800) {
    if (!useSmallIcons) {
      return isDayTime
          ? 'assets/images/main_icons/clear_sky_day.svg'
          : 'assets/images/main_icons/clear_sky_night.svg';
    } else {
      return isDayTime
          ? 'assets/images/small_icons/clear_sky_day.svg'
          : 'assets/images/small_icons/clear_sky_night.svg';
    }
  }

  // Clouds
  if (iconId == 801) {
    if (!useSmallIcons) {
      return isDayTime
          ? 'assets/images/main_icons/few_clouds.svg'
          : 'assets/images/main_icons/few_clouds_night.svg';
    } else {
      return isDayTime
          ? 'assets/images/small_icons/few_clouds.svg'
          : 'assets/images/small_icons/few_clouds_night.svg';
    }
  }

  if (iconId >= 802 && iconId <= 804) {
    if (!useSmallIcons) {
      return 'assets/images/main_icons/scattered_clouds.svg';
    } else {
      return 'assets/images/small_icons/scattered_clouds.svg';
    }
  }

  return '';
}
