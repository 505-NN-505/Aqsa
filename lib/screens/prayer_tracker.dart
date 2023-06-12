import 'package:flutter/material.dart';

// class PrayerTrackerApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Prayer Tracker',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: Scaffold(
//         appBar: AppBar(title: Text('Namaz Tracker')),
//         body: Center(
//           child: PrayerTracker(),
//         ),
//       ),
//     );
//   }
// }

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

  double calculateProgress() {
    int completedTasks =
        prayerCompletion.where((completed) => completed).length;
    return completedTasks / prayerCompletion.length;
  }

  void updateprayerCompletion(int index) {
    setState(() {
      prayerCompletion[index] = !prayerCompletion[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Prayer Tracker',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: LinearProgressIndicator(value: calculateProgress(),minHeight: 18,),
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            prayerCompletion.length,
            (index) => GestureDetector(
              onTap: () {
                updateprayerCompletion(index);
              },
              child: Container(
                width: 70.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(27.0),
                  border: Border.all(color: Colors.black, width: 1.0),
                  color: prayerCompletion[index]
                      ? Colors.green
                      : Colors.lightBlue[100],
                ),
                child: Center(
                  child: Text(
                    prayerNames[index],
                    style: TextStyle(
                      color:
                          prayerCompletion[index] ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
