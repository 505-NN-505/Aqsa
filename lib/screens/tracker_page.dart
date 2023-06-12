import 'package:aqsa_muslim_prayer_assistant/screens/calender.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/daily_hadith.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/linear_progress_tracker.dart';
import 'package:flutter/material.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TrackerPageState();
  }
}

class _TrackerPageState extends State<TrackerPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prayer Tracker',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: ListView(
          children: const [
            SizedBox(
              height: 300,
              child: Calender(),
            ),
            // DailyHadith(),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LinearProgressTracker(index: 0),
                  SizedBox(
                    width: 20,
                  ),
                  LinearProgressTracker(index: 1),
                  SizedBox(
                    width: 20,
                  ),
                  LinearProgressTracker(index: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
