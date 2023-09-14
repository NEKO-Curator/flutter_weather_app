import 'package:flutter_weather_app/features/weather/data/models/location_model.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationDataSource {
  Future<LocationModel> getCurrentPosition();
  Future<bool> handleLocationPermission();
}

class LocationDataSourceImpl extends LocationDataSource {
  @override
  Future<LocationModel> getCurrentPosition() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
      );

      return LocationModel.fromPosition(position);
    } catch (e) {
      throw Exception('Could not get location: $e');
    }
  }

  @override
  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception(
          'Location services are disabled. Please enable the services');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return true;
  }
}