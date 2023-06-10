import 'package:flutter/material.dart';
import 'timer.dart';

class TimerApp extends StatelessWidget {
  const TimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer',
      theme: ThemeData(),
      home: const TimerPage(),
    );
  }
}
