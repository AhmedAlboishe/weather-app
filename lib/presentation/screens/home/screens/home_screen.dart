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
            return RefreshIndicator(
              onRefresh: weatherCtrl.getWeatherData,
              child: ListView(
                children: const [
                  Gap(30),
                  CurrentWeatherWidget(),
                  WeatherDetailsWidget(),
                  Gap(50),
                  WeatherGraphWidget(),
                  Gap(50),
                  HourlyForecastWidget(),
                  Gap(10),
                  DailyForecastWidget(),
                  Gap(10),
                ],
              ),
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
