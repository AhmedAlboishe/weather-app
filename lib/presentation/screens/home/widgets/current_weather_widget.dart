import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_style.dart';
import '../../../../core/utils/constants/extensions/time_format_extension.dart';
import '../../../../core/utils/constants/extensions/weather_condition_extension.dart';
import '../../../../core/utils/constants/extensions/weather_icon_extension.dart';
import '../controller/weather_controller.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GetBuilder<WeatherController>(
        builder: (weatherCtrl) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${weatherCtrl.weatherModel!.city}, ${weatherCtrl.weatherModel!.country}\nLastUpdate: ${int.parse(weatherCtrl.weatherModel!.lastUpdate.split(' ')[1].split(':')[0]).toAmPm(weatherCtrl.weatherModel!.lastUpdate.split(' ')[1].split(':')[1])}',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: '${weatherCtrl.weatherModel!.temp}'),
                      const TextSpan(
                        text: '°',
                        style: AppStyle.degreeStyle,
                      ),
                    ],
                    style: AppStyle.primaryClrFS100,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        weatherCtrl.weatherModel!.weatherCondition
                            .getWeatherIcon(
                          weatherCtrl.weatherModel!.isDay == 1,
                        ),
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: FittedBox(
                          child: Text(
                            weatherCtrl.weatherModel!.weatherCondition
                                .toShortWeatherCondition(),
                            maxLines: 1,
                            style: AppStyle.primaryClrFS40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
