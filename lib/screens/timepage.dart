import 'package:aqsa_muslim_prayer_assistant/screens/al_adhan_api/al_adhan_api.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/daily_hadith.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/prayer_tracker.dart';
import 'package:aqsa_muslim_prayer_assistant/utilities/storage_service.dart';
import 'package:aqsa_muslim_prayer_assistant/utilities/time_checker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePage extends StatefulWidget {
  const TimePage({super.key});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  var valueLocation = "";
  var _date = "";

  Future getStorageLocation() async {
    var str = await SecureStorage.get("location");
    setState(() {
      valueLocation = str;
    });
  }

  @override
  void initState() {
    getStorageLocation();
    setState(() {
      _date = TimeChecker.getCurrentDate();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prayer Tracker',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: ListView(
          children: [
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: Text(_date),
                trailing: Text(valueLocation),
                leadingAndTrailingTextStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'assets/mosque.png',
                  height: 150,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AlAdhanApi(),
                ],
              ),
            ),
            DailyHadith(),
          ],
        ),
      ),
    );
  }
}
