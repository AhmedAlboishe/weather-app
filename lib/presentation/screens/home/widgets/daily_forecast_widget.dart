import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_decoration.dart';
import '../../../../core/theme/app_style.dart';
import '../../../../core/utils/constants/image_constants.dart';

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
      child: Column(
        children: List.generate(
          3,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0),
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    'Wednesday',
                    style: AppStyle.fS16,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SvgPicture.asset(ImageConstants.cloudy),
                ),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: '25'),
                      TextSpan(
                        text: '°',
                        style: AppStyle.degreeStyle,
                      ),
                      TextSpan(text: '  20'),
                      TextSpan(
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
    );
  }
}
