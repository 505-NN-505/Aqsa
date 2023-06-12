import 'package:intl/intl.dart';

class TimeChecker {
  static bool isTimeGreaterEqual(String startTime) {
    DateTime now = DateTime.now();
    DateTime start = _parseDigitalTime(startTime, now);

    return now.isAfter(start) || now.isAtSameMomentAs(start);
  }

  static bool isTimeBefore(String endTime) {
    DateTime now = DateTime.now();
    DateTime end = _parseDigitalTime(endTime, now);
    return now.isBefore(end);
  }

  static DateTime _parseDigitalTime(String time, DateTime currentDateTime) {
    List<String> timeComponents = time.split(':');
    int hours = int.parse(timeComponents[0]);
    int minutes = int.parse(timeComponents[1]);
    return DateTime(
      currentDateTime.year,
      currentDateTime.month,
      currentDateTime.day,
      hours,
      minutes,
    );
  }
  static String convertToAmPm(String digitalTime) {
    DateFormat inputFormat = DateFormat('HH:mm');
    DateFormat outputFormat = DateFormat('hh:mm a');

    DateTime dateTime = inputFormat.parse(digitalTime);
    String amPmTime = outputFormat.format(dateTime);

    return amPmTime;
  }

  static int calculateRemainingTimeInSeconds(String endTime) {
    DateTime now = DateTime.now();
    DateTime end = _parseDigitalTime(endTime, now);

    Duration remainingDuration = end.difference(now);
    int remainingSeconds = remainingDuration.inSeconds;

    return remainingSeconds;
  }
}
