import 'package:get/get.dart';

import '../controller/weather_controller.dart';

class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WeatherController());
  }
}
