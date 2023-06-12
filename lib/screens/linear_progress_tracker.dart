import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

import '../utilities/storage_service.dart';

class LinearProgressTracker extends StatefulWidget {
  final int index;

  const LinearProgressTracker({super.key, required this.index});

  @override
  State<LinearProgressTracker> createState() => _LinearProgressTrackerState();
}

class _LinearProgressTrackerState extends State<LinearProgressTracker> {
  late double value;
  late SecureStorage storage;

  @override
  void initState() {
    storage = SecureStorage();
    value = SecureStorage.get("LinearProgressTracker$widget.index") as double; // assign value from shared storage
    super.initState();
  }

  void increase() {
    setState(() {
      if (value < 1.0) {
        value += 0.2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SimpleAnimationProgressBar(
        height: 300,
        width: 20,
        backgroundColor: Colors.grey.shade800,
        foregrondColor: Colors.purple,
        ratio: value,
        direction: Axis.vertical,
        curve: Curves.fastLinearToSlowEaseIn,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(30),
        gradientColor:
            const LinearGradient(colors: [Colors.pink, Colors.purple]),
      ),
    );
  }
}
