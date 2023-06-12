import 'package:aqsa_muslim_prayer_assistant/screens/timer/timer.dart';
import 'package:aqsa_muslim_prayer_assistant/utilities/secured_storage.dart';
import 'package:aqsa_muslim_prayer_assistant/utilities/time_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/al_adhan_api_bloc.dart';

class AlAdhanApi extends StatefulWidget {
  const AlAdhanApi({super.key});

  @override
  State<AlAdhanApi> createState() => _AlAdhanApiState();
}

class _AlAdhanApiState extends State<AlAdhanApi> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlAdhanApiBloc, AlAdhanApiState>(
      builder: (context, state) {
        SecureStorage storage = SecureStorage();
        print(storage.get("location"));
        if (state is AlAdhanApiLoaded) {
          late String currentWakt = "";
          late String currentStartTime = "";
          late int remainingTime = 0;
          late int remainingTimeIftar = 0;

          Map<String, String> timingMap = {};

          timingMap["Imsak"] = state.model.data?.timings?.imsak ?? "N/A";
          timingMap["Fajr"] = state.model.data?.timings?.fajr ?? "N/A";
          timingMap["Dhuhr"] = state.model.data?.timings?.dhuhr ?? "N/A";
          timingMap["Asr"] = state.model.data?.timings?.asr ?? "N/A";
          timingMap["Maghrib"] = state.model.data?.timings?.maghrib ?? "N/A";
          timingMap["Isha"] = state.model.data?.timings?.isha ?? "N/A";

          timingMap.forEach((k, v) {
            if (TimeChecker.isTimeGreaterEqual(v)) {
              currentWakt = k;
              currentStartTime = TimeChecker.convertToAmPm(v);
            }
          });

          if (TimeChecker.isTimeBefore(timingMap["Fajr"]!)) {
            remainingTime =
                TimeChecker.calculateRemainingTimeInSeconds(timingMap["Fajr"]!);
          } else if (TimeChecker.isTimeBefore(timingMap["Fajr"]!)) {
            remainingTime =
                TimeChecker.calculateRemainingTimeInSeconds(timingMap["Fajr"]!);
          } else if (TimeChecker.isTimeBefore(timingMap["Asr"]!)) {
            remainingTime =
                TimeChecker.calculateRemainingTimeInSeconds(timingMap["Asr"]!);
          } else if (TimeChecker.isTimeBefore(timingMap["Maghrib"]!)) {
            remainingTime = TimeChecker.calculateRemainingTimeInSeconds(
                timingMap["Maghrib"]!);
          } else if (TimeChecker.isTimeBefore(timingMap["Isha"]!)) {
            remainingTime =
                TimeChecker.calculateRemainingTimeInSeconds(timingMap["Isha"]!);
          }

          remainingTimeIftar =
                TimeChecker.calculateRemainingTimeInSeconds(timingMap["Maghrib"]!);

          return Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Now: $currentWakt",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                Text(
                                  "Starting Time: ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                Text(
                                  currentStartTime,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
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
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Suhur: ${TimeChecker.convertToAmPm(timingMap["Imsak"]!)}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              Text(
                                "Iftar: ${TimeChecker.convertToAmPm(timingMap["Maghrib"]!)}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ]),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Text(
                                'Time Remaining',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'for ${currentWakt}',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              TimerPage(duration: remainingTime),
                            ],
                          ),
                        )),
                    Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Countdown to',
                                    style: TextStyle(
                                        fontSize: 17, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Iftar',
                                    style: TextStyle(
                                        fontSize: 17, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              TimerPage(duration: remainingTimeIftar),
                            ],
                          ),
                        )),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Text('');
        }
      },
    );
  }
}
