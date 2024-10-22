import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/models/weather_model.dart';
import '../../../../core/services/location_services.dart';
import '../../../../core/services/weather_services.dart';

class WeatherController extends GetxController {
  WeatherModel? weatherModel;
  final WeatherServices weatherServices = WeatherServices();
  final LocationServices locationServices = LocationServices();
  final ScrollController scrollController = ScrollController();
  int pointIndex = 0;
  List<String>? weatherDetails;
  late bool showConnectionError;
  late bool showLocationError;
  late bool determiningYourLocation;

  @override
  Future<void> onInit() async {
    await getWeatherData();
    super.onInit();
  }

  @override
  onReady() {
    scrollToCurrentHour();
  }

  Future<void> getWeatherData() async {
    showConnectionError = false;
    showLocationError = false;
    determiningYourLocation = true;
    update();

    final Map<String, double>? location =
        await locationServices.getCurrentLocation();

    log('$location');
    if (location != null) {
      determiningYourLocation = false;
      update();

      weatherModel = await weatherServices.getWeather(
        lat: location['lat']!,
        lang: location['lang']!,
      );
      if (weatherModel != null) {
        initialPointIndex();

        weatherDetails = [
          '${weatherModel?.humidity}%',
          '${weatherModel?.windSpeed} km/h',
          '${weatherModel?.precipitation} mm'
        ];
      } else {
        showConnectionError = true;
      }
    } else {
      showLocationError = true;
    }
    update();
  }

  void initialPointIndex() {
    String currentHour = DateTime.now().hour.toString();
    if (int.parse(currentHour) < 10) {
      currentHour = '0$currentHour';
    }
    for (var i = 0; i < weatherModel!.hourlyForecastModel.hours.length; i++) {
      if (currentHour == weatherModel!.hourlyForecastModel.hours[i]) {
        pointIndex = i;
      }
    }
  }

  void scrollToCurrentHour() {
    if (weatherModel != null) {
      final currentHour =
          double.parse(weatherModel!.hourlyForecastModel.hours[pointIndex]);
      if (currentHour > 20) {
        scrollController.jumpTo(94.8 * 20);
      } else {
        scrollController.jumpTo(94.8 * currentHour);
      }
    }
  }
}
