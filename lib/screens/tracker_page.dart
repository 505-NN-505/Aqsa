import 'package:aqsa_muslim_prayer_assistant/screens/calender.dart';
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
            SizedBox(height: 300,child: Calender(),),
          ],
        ),
      ),
    );
  }
}
