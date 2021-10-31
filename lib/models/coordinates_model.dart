import 'package:weather_app/entitys/coordinates_entity.dart';

class CoordinatesModel extends CoordinatesEntity {
  CoordinatesModel({
    required double latitude,
    required double longitude,
    required String cityName,
  }) : super(
          latitude: latitude,
          longitude: longitude,
          cityName: cityName,
        );

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) {
    return CoordinatesModel(
      latitude: json['coord']['lat'] as double,
      longitude: json['coord']['lon'] as double,
      cityName: json['name'] as String,
    );
  }
}
