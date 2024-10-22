class DailyForecastModel {
  final List<int> maxTemp;
  final List<int> minTemp;
  final List<String> weatherCondition;
  final List<String> daysDate;

  DailyForecastModel({
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
    required this.daysDate,
  });

  factory DailyForecastModel.fromJson(List<dynamic> json) {
    return DailyForecastModel(
      maxTemp: json
          .map(
            (e) => (e['day']['maxtemp_c'] as double).toInt(),
          )
          .toList(),
      minTemp: json
          .map(
            (e) => (e['day']['mintemp_c'] as double).toInt(),
          )
          .toList(),
      weatherCondition: json
          .map(
            (e) => (e['day']['condition']['text'] as String),
          )
          .toList(),
      daysDate: json
          .map(
            (e) => (e['date'] as String),
          )
          .toList(),
    );
  }
}
