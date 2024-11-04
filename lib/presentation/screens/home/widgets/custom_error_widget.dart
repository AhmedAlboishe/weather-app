import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/theme/app_style.dart';
import '../controller/weather_controller.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetBuilder<WeatherController>(
        builder: (weatherCtrl) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: FittedBox(
                child: Text(
                  weatherCtrl.showConnectionError
                      ? 'connection_failed'.tr
                      : 'location_permission_is_required'.tr,
                  style: AppStyle.primaryClrHeight1fS30,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 6,
              ),
              child: Text(
                weatherCtrl.showConnectionError
                    ? 'please_check_your_internet_connection_and_try_again'.tr
                    : 'please_enable_location_access_to_proceed'.tr,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(
              flex: 4,
            ),
            TextButton(
              onPressed: () async {
                if (weatherCtrl.showLocationError) {
                  await openAppSettings();
                  await Future.delayed(const Duration(seconds: 2));
                }
                await weatherCtrl.getWeatherData();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  weatherCtrl.showConnectionError
                      ? 'try_again'.tr
                      : 'allow_location_access'.tr,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
