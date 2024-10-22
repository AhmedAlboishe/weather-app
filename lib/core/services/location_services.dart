import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class LocationServices {
  Future<Map<String, double>?> getCurrentLocation() async {
    try {
      await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: AndroidSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      return {'lang': position.longitude, 'lat': position.latitude};
    } catch (e) {
      log('error $e');
    }
    return null;
  }
}
