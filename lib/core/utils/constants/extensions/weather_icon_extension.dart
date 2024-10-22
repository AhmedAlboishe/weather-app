import '../image_constants.dart';

extension WeatherIconExtension on String {
  String getWeatherIcon(bool isDay) {
    return switch (this) {
      'Clear' => ImageConstants.clear,
      'Clear ' => ImageConstants.clear,
      'Sunny' => ImageConstants.sunny,
      'Partly cloudy' => isDay
          ? ImageConstants.partlyCloudyDay
          : ImageConstants.partlyCloudyNight,
      'Partly Cloudy ' => isDay
          ? ImageConstants.partlyCloudyDay
          : ImageConstants.partlyCloudyNight,
      'Partly Cloudy' => isDay
          ? ImageConstants.partlyCloudyDay
          : ImageConstants.partlyCloudyNight,
      'Cloudy' =>
        isDay ? ImageConstants.cloudyClearDay : ImageConstants.cloudyClearNight,
      'Cloudy ' =>
        isDay ? ImageConstants.cloudyClearDay : ImageConstants.cloudyClearNight,
      'Overcast' => ImageConstants.cloudy,
      'Overcast ' => ImageConstants.cloudy,
      'Mist' => ImageConstants.mist,
      'Patchy rain possible' =>
        isDay ? ImageConstants.rainDay : ImageConstants.rainNight,
      'Patchy rain nearby' =>
        isDay ? ImageConstants.rainDay : ImageConstants.rainNight,
      'Patchy snow possible' => ImageConstants.blizzard,
      'Patchy sleet possible' => ImageConstants.sleet,
      'Patchy freezing drizzle possible' =>
        isDay ? ImageConstants.drizzleDay : ImageConstants.drizzleNight,
      'Thundery outbreaks possible' => isDay
          ? ImageConstants.scatteredThunderstormDay
          : ImageConstants.severThunderstorm,
      'Blowing snow' => ImageConstants.blowingSnow,
      'Blizzard' => ImageConstants.blizzard,
      'Fog' => ImageConstants.fog,
      'Freezing fog' => ImageConstants.fog,
      'Patchy light drizzle' =>
        isDay ? ImageConstants.drizzleDay : ImageConstants.drizzleNight,
      'Light drizzle' => ImageConstants.drizzle,
      'Freezing drizzle' => ImageConstants.hail,
      'Heavy freezing drizzle' => ImageConstants.sleet,
      'Patchy light rain' =>
        isDay ? ImageConstants.rainDay : ImageConstants.rainNight,
      'Light rain' => ImageConstants.rain,
      'Moderate rain at times' => isDay
          ? ImageConstants.scatteredShowersDay
          : ImageConstants.scatteredShowersNight,
      'Moderate rain' => isDay
          ? ImageConstants.scatteredShowersDay
          : ImageConstants.scatteredShowersNight,
      'Heavy rain at times' => ImageConstants.heavyRain,
      'Heavy rain' => ImageConstants.heavyRain,
      'Light freezing rain' => ImageConstants.hail,
      'Moderate or heavy freezing rain' => ImageConstants.hail,
      'Light sleet' => ImageConstants.sleet,
      'Moderate or heavy sleet' => ImageConstants.sleet,
      'Patchy light snow' => ImageConstants.sleet,
      'Light snow' => ImageConstants.sleet,
      'Patchy moderate snow' => ImageConstants.sleet,
      'Moderate snow' => ImageConstants.blizzard,
      'Patchy heavy snow' => ImageConstants.blizzard,
      'Heavy snow' => ImageConstants.blizzard,
      'Ice pellets' => ImageConstants.hail,
      'Light rain shower' => ImageConstants.drizzle,
      'Moderate or heavy rain shower' => ImageConstants.rain,
      'Torrential rain shower' => ImageConstants.heavyRain,
      'Light sleet showers' => ImageConstants.sleet,
      'Moderate or heavy sleet showers' => ImageConstants.sleet,
      'Light snow showers' => ImageConstants.sleet,
      'Moderate or heavy snow showers' => ImageConstants.blizzard,
      'Light showers of ice pellets' => ImageConstants.hail,
      'Moderate or heavy showers of ice pellets' => ImageConstants.hail,
      'Patchy light rain with thunder' => ImageConstants.rainThunderstorm,
      'Moderate or heavy rain with thunder' => ImageConstants.rainThunderstorm,
      'Patchy light snow with thunder' => ImageConstants.rainThunderstorm,
      'Moderate or heavy snow with thunder' => ImageConstants.rainThunderstorm,
      'Thundery outbreaks in nearby' => isDay
          ? ImageConstants.scatteredThunderstormDay
          : ImageConstants.severThunderstorm,
      _ => ImageConstants.snow,
    };
  }
}
