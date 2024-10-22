extension TimeFormatExtension on int {
  String toAmPm([String? minutes]) {
    String period = this >= 12 ? "pm" : "am";
    int formattedHour = this % 12 == 0 ? 12 : this % 12;
    if (minutes != null) {
      return "$formattedHour:$minutes $period";
    }
    return "$formattedHour $period";
  }
}
