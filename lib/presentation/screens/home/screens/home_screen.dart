import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controller/weather_controller.dart';
import '../widgets/current_weather_widget.dart';
import '../widgets/custom_error_widget.dart';
import '../widgets/custom_loading_widget.dart';
import '../widgets/daily_forecast_widget.dart';
import '../widgets/hourly_forecast_widget.dart';
import '../widgets/weather_details_widget.dart';
import '../widgets/weather_graph_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<WeatherController>(
        builder: (weatherCtrl) {
          if (weatherCtrl.weatherModel != null) {
            return const Column(
              children: [
                Gap(50),
                CurrentWeatherWidget(),
                WeatherDetailsWidget(),
                MaxGap(50),
                WeatherGraphWidget(),
                MaxGap(50),
                HourlyForecastWidget(),
                MaxGap(10),
                DailyForecastWidget(),
              ],
            );
          } else if (weatherCtrl.showConnectionError ||
              weatherCtrl.showLocationError) {
            return const CustomErrorWidget();
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }
}
