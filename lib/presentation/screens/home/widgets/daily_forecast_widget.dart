import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_decoration.dart';
import '../../../../core/theme/app_style.dart';
import '../../../../core/utils/constants/extensions/weather_icon_extension.dart';
import '../controller/weather_controller.dart';

class DailyForecastWidget extends StatelessWidget {
  const DailyForecastWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      decoration: AppDecoration.containerPClrCircleBorder20,
      child: GetBuilder<WeatherController>(
        builder: (weatherCtrl) => Column(
          children: List.generate(
            weatherCtrl.weatherModel!.dailyForecastModel.maxTemp.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        index == 0
                            ? 'today'.tr
                            : DateFormat('EEEE')
                                .format(
                                  DateTime.parse(
                                    weatherCtrl.weatherModel!.dailyForecastModel
                                        .daysDate[index],
                                  ),
                                )
                                .tr,
                        style: AppStyle.fS16,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SvgPicture.asset(
                      weatherCtrl.weatherModel!.dailyForecastModel
                          .weatherCondition[index]
                          .getWeatherIcon(true),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  '${weatherCtrl.weatherModel!.dailyForecastModel.maxTemp[index]}',
                            ),
                            const TextSpan(
                              text: '°',
                              style: AppStyle.degreeStyle,
                            ),
                            TextSpan(
                              text:
                                  '  ${weatherCtrl.weatherModel!.dailyForecastModel.minTemp[index]}',
                            ),
                            const TextSpan(
                              text: '°',
                              style: AppStyle.degreeStyle,
                            ),
                          ],
                          style: AppStyle.fS16,
                        ),
                        textAlign: weatherCtrl.isArabic
                            ? TextAlign.left
                            : TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
