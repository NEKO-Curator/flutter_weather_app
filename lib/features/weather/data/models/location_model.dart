import 'package:flutter_weather_app/features/weather/domain/entities/location_entity.dart';
import 'package:geolocator/geolocator.dart';

class LocationModel extends LocationEntity {
  const LocationModel({required super.lat, required super.lon});
  factory LocationModel.fromPosition(Position position) {
    return LocationModel(lat: position.latitude, lon: position.longitude);
  }
}
