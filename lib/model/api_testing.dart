import 'dart:convert';

import 'package:aqsa_muslim_prayer_assistant/model/districts_info/district.dart';
import 'package:aqsa_muslim_prayer_assistant/model/districts_info/districts_info.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:aqsa_muslim_prayer_assistant/model/prayer_timings/prayer_timings.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';

class ApiTesting extends StatefulWidget {
  const ApiTesting({super.key});

  @override
  State<ApiTesting> createState() => _ApiTestingState();
}

class _ApiTestingState extends State<ApiTesting> {
  late Future<PrayerTimings> timingObject;
  late Future<List<District>> districtObject;

  Future<List<District>> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/bd_districts.json');
    var data = json.decode(jsonEncode(jsonText));
    DistrictsInfo districtsInfo = DistrictsInfo.fromJson(jsonDecode(data));
    return districtsInfo.districts ?? [];
  }

  @override
  void initState() {
    timingObject = fetchData();
    districtObject = loadJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder<List<District>>(
              future: districtObject,
              builder: (context, snapshot) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) => TextButton(
                    child: Text(
                      snapshot.data?[index].bnName ?? "N/A",
                    ),
                    onPressed: () async {
                      final data = await fetchData();
                      print(data.data?.timings?.fajr ?? "No data!");
                    },
                  ),
                );
              }),
          FutureBuilder<PrayerTimings>(
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
        ],
      ),
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
