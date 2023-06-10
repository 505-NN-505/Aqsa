import 'package:aqsa_muslim_prayer_assistant/screens/calender.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/daily_hadith.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prayer Tracker',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: ListView(
          children: const [
            SizedBox(height: 300,child: Calender(),),
            DailyHadith(),
            
          ],
        ),
      ),
    );
  }
}