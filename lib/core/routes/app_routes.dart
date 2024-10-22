import 'package:get/get.dart';

import '../../presentation/screens/home/binding/weather_binding.dart';
import '../../presentation/screens/home/screens/home_screen.dart';

class AppRoutes {
  static const String homeScreen = '/home_screen';

  static List<GetPage> pages = [
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      binding: WeatherBinding(),
    ),
  ];
}
