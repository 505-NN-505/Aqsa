import 'package:aqsa_muslim_prayer_assistant/screens/al_adhan_api/al_adhan_api.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/daily_hadith.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/prayer_tracker.dart';
import 'package:flutter/material.dart';

class TimePage extends StatefulWidget {
  const TimePage({super.key});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prayer Tracker',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: ListView(
          children: [
            Center(
              child: Image.asset(
                'assets/mosque.png',
                height: 150,
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
