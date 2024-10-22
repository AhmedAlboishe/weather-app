import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controller/weather_controller.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
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
              flex: 4,
            ),
            LottieBuilder.asset(
              'assets/lottie/loading.json',
            ),
            const Spacer(
              flex: 2,
            ),
            Text(
              weatherCtrl.determiningYourLocation
                  ? 'Determining your location...'
                  : 'Fetching weather data...',
              textAlign: TextAlign.center,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
