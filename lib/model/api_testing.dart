import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:aqsa_muslim_prayer_assistant/model/prayer_timings/prayer_timings.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

class ApiTesting extends StatefulWidget {
  const ApiTesting({super.key});

  @override
  State<ApiTesting> createState() => _ApiTestingState();
}

class _ApiTestingState extends State<ApiTesting> {
  late List data;

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/bd_district.json');
    setState(() => data = json.decode(jsonText));
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    Future<PrayerTimings> timingObject = fetchData();
    return Scaffold(
      body: FutureBuilder<PrayerTimings>(
          future: timingObject,
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    snapshot.data?.data?.timings?.fajr ?? "",
                  ),
                  onPressed: () async {
                    final data = await fetchData();
                    print(data.data?.timings?.fajr ?? "No data!");
                  },
                ),
              ],
            );
          }),
    );
  }
}

Future<PrayerTimings> fetchData() async {
  var dio = Dio();
  var response = await dio.get(
      "https://api.aladhan.com/v1/timings/06-06-2023?latitude=23.7115253&longitude=90.4111451&method=2");

  Map<String, dynamic> userMap = jsonDecode(jsonEncode(response.data));
  var prayerTimings = PrayerTimings.fromJson(userMap);
  return prayerTimings;
}