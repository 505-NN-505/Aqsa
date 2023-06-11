import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import '../../../model/prayer_timings/prayer_timings.dart';

class ApiProvider {
  final Dio _dio = Dio();
  late String _url;
  late String _date;

  Future<PrayerTimings> fetchTimings(
      String latitude, String longitude, String calcMethod, String schoolMethod) async {
    final now = DateTime.now();
    String formatter = DateFormat('dd-mm-yyyy').format(now);
    _date = formatter;

    _url =
        "https://api.aladhan.com/v1/timings/$_date?latitude=$latitude&longitude=$longitude&method=$calcMethod&school=$schoolMethod";

    Response response = await _dio.get(_url);
    Map<String, dynamic> userMap = jsonDecode(jsonEncode(response.data));
    var prayerTimings = PrayerTimings.fromJson(userMap);
    return prayerTimings;
  }
}
