import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_decoration.dart';
import '../../../../core/theme/app_style.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/utils/constants/image_constants.dart';

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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                6,
                (index) => Container(
                  height: 140,
                  width: 85,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: AppDecoration.containerPClrCircleBorder10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        index == 2 ? 'now' : '${index + 1} am',
                        style: AppStyle.fS16.copyWith(
                          color: index == 2 ? primaryClr : null,
                        ),
                      ),
                      SvgPicture.asset(ImageConstants.sunny),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: '25'),
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
          ),
        ],
      ),
    );
  }
}
