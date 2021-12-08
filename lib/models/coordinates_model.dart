import 'package:weather_app/entitys/city_info_entity.dart';

class CityInfoModel extends CityInfoEntity {
  CityInfoModel({
    required CoordModel coord,
    required String cityName,
  }) : super(
          coord: coord,
          cityName: cityName,
        );

  factory CityInfoModel.fromJson(Map<String, dynamic> json) {
    return CityInfoModel(
      coord: CoordModel.fromJson(json['coord'] as Map<String, dynamic>),
      cityName: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'coord': coord.toJson(),
      'name': cityName,
    };
  }
}

class CoordModel extends CoordEntity {
  CoordModel({
    required double latitude,
    required double longitude,
  }) : super(latitude: latitude, longitude: longitude);

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(
      latitude: json['lat'] as double,
      longitude: json['lon'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'lat': latitude,
      'lon': longitude,
    };
  }
}
