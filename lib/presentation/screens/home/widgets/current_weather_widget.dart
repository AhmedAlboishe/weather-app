import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_style.dart';
import '../../../../core/utils/constants/image_constants.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({
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
            'Libya, Tripoli\nLastUpdate: 13:05',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '18'),
                    TextSpan(
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
                      ImageConstants.sunny,
                      height: 100,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: FittedBox(
                        child: Text(
                          'Sunny',
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
    );
  }
}
