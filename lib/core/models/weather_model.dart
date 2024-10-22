import 'daily_forecast_model.dart';
import 'hourly_forecast_model.dart';

class WeatherModel {
  final int temp;
  final int humidity;
  final String weatherCondition;
  final double windSpeed;
  final String lastUpdate;
  final String city;
  final String country;
  final HourlyForecastModel hourlyForecastModel;
  final DailyForecastModel dailyForecastModel;
  final double precipitation;
  final int isDay;

  WeatherModel({
    required this.temp,
    required this.humidity,
    required this.weatherCondition,
    required this.windSpeed,
    required this.lastUpdate,
    required this.city,
    required this.country,
    required this.hourlyForecastModel,
    required this.dailyForecastModel,
    required this.precipitation,
    required this.isDay,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final data = json['current'];
    return WeatherModel(
      temp: (data['temp_c'] as double).toInt(),
      humidity: data['humidity'] as int,
      weatherCondition: data['condition']['text'] as String,
      windSpeed: data['wind_kph'] as double,
      lastUpdate: data['last_updated'] as String,
      city: json['location']['name'],
      country: json['location']['country'],
      precipitation: data['precip_mm'],
      hourlyForecastModel: HourlyForecastModel.fromJson(
        json['forecast']['forecastday'][0]['hour'],
      ),
      dailyForecastModel: DailyForecastModel.fromJson(
        json['forecast']['forecastday'],
      ),
      isDay: data['is_day'],
    );
  }
}
