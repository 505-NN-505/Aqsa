import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PrayerTracker extends StatefulWidget {
  @override
  _PrayerTrackerState createState() => _PrayerTrackerState();
}

class _PrayerTrackerState extends State<PrayerTracker> {
  List<bool> prayerCompletion = List.generate(5, (index) => false);
  List<String> prayerNames = [
    'Fajr',
    'Juhr',
    'Asr',
    'Maghrib',
    'Isha',
  ];

  int selectedPrayerCount = 0;
  double currentProgress = 0.0;
  double targetProgress = 0.0;

  void updatePrayerCompletion(int index) {
    setState(() {
      prayerCompletion[index] = !prayerCompletion[index];
      selectedPrayerCount += prayerCompletion[index] ? 1 : -1;

      targetProgress = selectedPrayerCount / prayerCompletion.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Daily Prayer Tracker',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8.0),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: currentProgress, end: targetProgress),
            duration: Duration(milliseconds: 800),
            builder: (context, value, _) {
              currentProgress = value;
              return CircularPercentIndicator(
                radius: 140,
                lineWidth: 40,
                percent: currentProgress,
                progressColor: Colors.deepPurple,
                backgroundColor: Colors.deepPurple.shade100,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  '${(currentProgress * 100).toStringAsFixed(0)} %',
                  style: TextStyle(fontSize: 50),
                ),
              );
            },
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              prayerCompletion.length,
              (index) => GestureDetector(
                onTap: () {
                  updatePrayerCompletion(index);
                },
                child: Container(
                  width: 74.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(27.0),
                    border: Border.all(color: Colors.white, width: 3.0),
                    color: prayerCompletion[index]
                        ? Colors.green
                        : Colors.lightBlue[100],
                  ),
                  child: Center(
                    child: Text(
                      prayerNames[index],
                      style: TextStyle(
                        color: prayerCompletion[index]
                            ? Colors.white
                            : Colors.black,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
