import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherServices {
  final Dio _dio = Dio();

  Future<WeatherModel?> getWeather({
    required double lat,
    required double lang,
  }) async {
    try {
      const String apiKey = 'YOUR_API_KEY';

      final response = await _dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$lat $lang &days=3');

      final WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } catch (e) {
      log('error $e');
    }
    return null;
  }
}
