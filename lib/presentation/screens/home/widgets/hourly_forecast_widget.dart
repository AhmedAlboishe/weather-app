import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_decoration.dart';
import '../../../../core/theme/app_style.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/utils/constants/extensions/time_format_extension.dart';
import '../../../../core/utils/constants/extensions/weather_icon_extension.dart';
import '../controller/weather_controller.dart';

class HourlyForecastWidget extends StatelessWidget {
  const HourlyForecastWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Today',
            style: AppStyle.iconClrFS20,
          ),
          GetBuilder<WeatherController>(
            builder: (weatherCtrl) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SingleChildScrollView(
                controller: weatherCtrl.scrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    weatherCtrl.weatherModel!.hourlyForecastModel.hours.length,
                    (index) => Container(
                      height: 140,
                      width: 85,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: AppDecoration.containerPClrCircleBorder10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            index == weatherCtrl.pointIndex
                                ? 'now'
                                : int.parse(weatherCtrl.weatherModel!
                                        .hourlyForecastModel.hours[index])
                                    .toAmPm(),
                            style: AppStyle.fS16.copyWith(
                              color: index == weatherCtrl.pointIndex
                                  ? primaryClr
                                  : null,
                            ),
                          ),
                          SvgPicture.asset(
                            weatherCtrl.weatherModel!.hourlyForecastModel
                                .weatherCondition[index]
                                .getWeatherIcon(
                              weatherCtrl.weatherModel!.hourlyForecastModel
                                      .isDay[index] ==
                                  1,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text:
                                        '${(weatherCtrl.weatherModel!.hourlyForecastModel.hourlyForecast[index] as double).toInt()}'),
                                const TextSpan(
                                  text: '°',
                                  style: AppStyle.degreeStyle,
                                ),
                              ],
                              style: AppStyle.fS16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
