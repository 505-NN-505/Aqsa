import 'package:aqsa_muslim_prayer_assistant/screens/linear_progress_tracker.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/tracker_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PrayerTracker extends StatefulWidget {
  @override
  _PrayerTrackerState createState() => _PrayerTrackerState();
}

class _PrayerTrackerState extends State<PrayerTracker> {
  List<String> prayerNames = [
    'Fajr',
    'Juhr',
    'Asr',
    'Maghrib',
    'Isha',
  ];

  late int selectedPrayerCount;
  double currentProgress = 0.0;
  late double targetProgress;

  bool getPrayerCompletion(int index) {
    return context.read<TrackerController>().prayerCompletion(index);
  }

  void setPrayerCompletion(int index, bool value) {
    context.read<TrackerController>().updateCompletion(index, value);
  }

  void updatePrayerCompletion(int index) {
    setState(() {
      setPrayerCompletion(index, !getPrayerCompletion(index));
      selectedPrayerCount += getPrayerCompletion(index) ? 1 : -1;
      context.read<TrackerController>().setCount(selectedPrayerCount);
      targetProgress = selectedPrayerCount / 5;
      context.read<TrackerController>().setScore(targetProgress);
    });
  }

  @override
  void initState() {
    selectedPrayerCount = context.read<TrackerController>().count;
    targetProgress = context.read<TrackerController>().progress;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Daily Prayer Tracker',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      5,
                      (index) => GestureDetector(
                        onTap: () {
                          updatePrayerCompletion(index);
                        },
                        child: Container(
                          width: 70.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(27.0),
                            border: Border.all(color: Colors.white, width: 3.0),
                            color: getPrayerCompletion(index)
                                ? Color.fromARGB(255, 44, 232, 72)
                                : Colors.lightBlue[100],
                          ),
                          child: Center(
                            child: Text(
                              prayerNames[index],
                              style: TextStyle(
                                color: getPrayerCompletion(index)
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: currentProgress, end: targetProgress),
                    duration: Duration(milliseconds: 800),
                    builder: (context, value, _) {
                      currentProgress = value;
                      return CircularPercentIndicator(
                        radius: 70,
                        lineWidth: 20,
                        percent: currentProgress,
                        progressColor: Colors.deepPurple,
                        backgroundColor: Colors.deepPurple.shade100,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Text(
                          '${(currentProgress * 100).toStringAsFixed(0)} %',
                          style: TextStyle(fontSize: 30),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Weekly Prayer Tracker',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LinearProgressTracker(
                        index: 6,
                        value: 0.8,
                      ),
                      LinearProgressTracker(
                        index: 5,
                        value: 0.6,
                      ),
                      LinearProgressTracker(
                        index: 4,
                        value: 1,
                      ),
                      LinearProgressTracker(
                        index: 3,
                        value: 1,
                      ),
                      LinearProgressTracker(
                        index: 2,
                        value: 1,
                      ),
                      LinearProgressTracker(
                        index: 1,
                        value: 1,
                      ),
                      LinearProgressTracker(
                        index: 0,
                        value: context.watch<TrackerController>().progress,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
