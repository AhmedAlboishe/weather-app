class HourlyForecastModel {
  final List<dynamic> hourlyForecast;
  final List<String> weatherCondition;
  final List<String> hours;
  final List<int> isDay;

  HourlyForecastModel({
    required this.hourlyForecast,
    required this.hours,
    required this.weatherCondition,
    required this.isDay,
  });

  factory HourlyForecastModel.fromJson(List<dynamic> json) {
    return HourlyForecastModel(
      hourlyForecast: json
          .map(
            (e) => (e['temp_c'] as double).toInt().toDouble(),
          )
          .toList(),
      hours: json
          .map(
            (e) => (e['time'] as String).split(' ')[1].split(':')[0],
          )
          .toList(),
      weatherCondition: json
          .map(
            (e) => (e['condition']['text'] as String),
          )
          .toList(),
      isDay: json
          .map(
            (e) => e['is_day'] as int,
          )
          .toList(),
    );
  }
}
