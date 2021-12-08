import 'package:weather_app/models/coordinates_model.dart';

class CityInfoEntity {
  final CoordModel coord;
  final String cityName;

  CityInfoEntity({
    required this.coord,
    required this.cityName,
  });
}

class CoordEntity {
  final double latitude;
  final double longitude;

  CoordEntity({required this.latitude, required this.longitude});
}
