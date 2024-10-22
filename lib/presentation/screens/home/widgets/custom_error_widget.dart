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
                      ? 'Connection Failed'
                      : 'Location permission\nis required',
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
                    ? 'please check your internet connection and try again'
                    : 'please enable location access to proceed',
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
                      ? 'Try Again'
                      : 'Allow Location Access',
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
