import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_style.dart';
import '../../../../core/utils/constants/image_constants.dart';

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({
    super.key,
  });
  static List svg = [
    ImageConstants.humidity,
    ImageConstants.windSpeed,
    ImageConstants.umbrella,
  ];
  static List txt = ['35%', '20 km/h', '11%'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          3,
          (index) => Row(
            children: [
              SvgPicture.asset(
                svg[index],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 10),
                child: Text(
                  txt[index],
                  style: AppStyle.fS18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
