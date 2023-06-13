import 'package:aqsa_muslim_prayer_assistant/screens/tracker_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

import '../utilities/storage_service.dart';

class LinearProgressTracker extends StatefulWidget {
  final int index;
  final double value;

  const LinearProgressTracker(
      {super.key, required this.index, required this.value});

  @override
  State<LinearProgressTracker> createState() => _LinearProgressTrackerState();
}

class _LinearProgressTrackerState extends State<LinearProgressTracker> {
  late var screenValue;

  Future getStorageProgressValue() async {
    var val = await SecureStorage.get("LinearProgressTracker${widget.index}");
    setState(() {
      screenValue = val;
    });
  }

  Future setStorageProgressValue(double value) async {
    await SecureStorage.set("LinearProgressTracker${widget.index}", value.toString());
  }

  @override
  void initState() {
    setState(() {
      screenValue = widget.value;
    });
    if (widget.index == 0) {
      setState(() {
        setStorageProgressValue(context.read<TrackerController>().progress);
      });
    } else {
      getStorageProgressValue();
    }
    print(screenValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SimpleAnimationProgressBar(
        height: 180,
        width: 25,
        backgroundColor: Colors.grey.shade800,
        foregrondColor: Colors.purple,
        ratio: widget.index == 0 ? context.read<TrackerController>().progress : widget.value,
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
