import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/daily_forecast_widget.dart';
import '../widgets/weather_graph_widget.dart';
import '../widgets/hourly_forecast_widget.dart';
import '../widgets/weather_details_widget.dart';
import '../widgets/current_weather_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
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
      ),
    );
  }
}
