import 'package:weather_app/entitys/city_info_entity.dart';

class CityInfoModel extends CityInfoEntity {
  CityInfoModel({
    required double latitude,
    required double longitude,
    required String cityName,
  }) : super(
          latitude: latitude,
          longitude: longitude,
          cityName: cityName,
        );

  factory CityInfoModel.fromJson(Map<String, dynamic> json) {
    return CityInfoModel(
      latitude: json['coord']['lat'] as double,
      longitude: json['coord']['lon'] as double,
      cityName: json['name'] as String,
    );
  }
}
