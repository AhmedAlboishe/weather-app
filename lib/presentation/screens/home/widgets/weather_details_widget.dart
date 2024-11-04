import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_style.dart';
import '../../../../core/utils/constants/list_constants.dart';
import '../controller/weather_controller.dart';

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GetBuilder<WeatherController>(
        builder: (weatherCtrl) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            3,
            (index) => Row(
              children: [
                SvgPicture.asset(
                  weatherDetailsIcons[index],
                  height: index == 0 ? 25 : 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
                  child: Text(
                    weatherCtrl.weatherDetailsValues![index] +
                        weatherDetailsUnits[index].tr,
                    style: AppStyle.fS16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
