import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/theme.dart';

class WeatherGraphWidget extends StatelessWidget {
  const WeatherGraphWidget({
    super.key,
  });
  static List<double> data = [26, 23, 23, 23, 28, 27, 24, 21];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Sparkline(
          data: data,
          lineWidth: 3,
          lineGradient: LinearGradient(
            colors: List.generate(
              data.length - 1,
              (i) => data[i] >= data[i + 1] ? iconClr : primaryClr,
            ),
          ),
          useCubicSmoothing: true,
          cubicSmoothingFactor: .2,
        ),
        TweenAnimationBuilder(
          tween: Tween<double>(
            begin: Get.width,
            end: 0,
          ),
          duration: const Duration(milliseconds: 1500),
          builder: (context, w, s) {
            return Align(
              alignment: Alignment.centerRight,
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
