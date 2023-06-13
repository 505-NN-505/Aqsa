import 'dart:convert';

import 'package:aqsa_muslim_prayer_assistant/utilities/time_checker.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import '../../../model/prayer_timings/prayer_timings.dart';

class ApiProvider {
  final Dio _dio = Dio();
  late String _url;
  late String _date;

  Future<PrayerTimings> fetchTimings(String latitude, String longitude,
      String calcMethod, String schoolMethod) async {

    _date = TimeChecker.getCurrentDate();

    _url =
        "https://api.aladhan.com/v1/timings/$_date?latitude=$latitude&longitude=$longitude&method=$calcMethod&school=$schoolMethod";

    Response response = await _dio.get(_url);
    print(_date);
    print(response);
    Map<String, dynamic> userMap = jsonDecode(jsonEncode(response.data));
    var prayerTimings = PrayerTimings.fromJson(userMap);
    return prayerTimings;
  }
}
