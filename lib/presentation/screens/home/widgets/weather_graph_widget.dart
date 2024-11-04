import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/theme.dart';
import '../controller/weather_controller.dart';

class WeatherGraphWidget extends StatelessWidget {
  const WeatherGraphWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GetBuilder<WeatherController>(
          builder: (weatherCtrl) {
            final hourlyForecast = weatherCtrl.isArabic
                ? weatherCtrl
                    .weatherModel!.hourlyForecastModel.hourlyForecast.reversed
                    .toList() as List<double>
                : weatherCtrl.weatherModel!.hourlyForecastModel.hourlyForecast
                    as List<double>;

            return Sparkline(
              data: hourlyForecast,
              lineWidth: 3,
              lineGradient: LinearGradient(
                colors: List.generate(
                  hourlyForecast.length - 1,
                  (i) => weatherCtrl.isArabic
                      ? hourlyForecast[i] <= hourlyForecast[i + 1]
                          ? iconClr
                          : primaryClr
                      : hourlyForecast[i] >= hourlyForecast[i + 1]
                          ? iconClr
                          : primaryClr,
                ),
              ),
              useCubicSmoothing: true,
              pointIndex: weatherCtrl.pointIndex,
              pointSize: 8,
              pointsMode: PointsMode.atIndex,
              pointColor: dialogClr,
              cubicSmoothingFactor: .2,
            );
          },
        ),
        TweenAnimationBuilder(
          tween: Tween<double>(
            begin: Get.width,
            end: 0,
          ),
          duration: const Duration(milliseconds: 2500),
          builder: (context, w, s) {
            return Align(
              alignment: Get.locale?.languageCode == 'ar'
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                width: w,
                height: 120,
                color: backgroundClr,
              ),
            );
          },
        ),
      ],
    );
  }
}
