import 'package:intl/intl.dart';

class TimeChecker {
  static bool isTimeLessEqual(String endTime) {
    DateTime now = DateTime.now();
    DateTime end = _parseDigitalTime(endTime, now);

    return now.isBefore(end) || now.isAtSameMomentAs(end);
  }

  static bool isTimeGreaterEqual(String startTime) {
    DateTime now = DateTime.now();
    DateTime start = _parseDigitalTime(startTime, now);

    return now.isAfter(start) || now.isAtSameMomentAs(start);
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

    if (end.isBefore(now)) {
      end = end.add(Duration(days: 1));
    }

    int difference = end.difference(now).inSeconds;

    return difference;
  }

  static String getCurrentDate() {
    DateTime now = DateTime.now();
    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    String formattedDate = dateFormat.format(now);
    return formattedDate;
  }
}
