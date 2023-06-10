import 'package:aqsa_muslim_prayer_assistant/data/hadith.dart';
import 'package:aqsa_muslim_prayer_assistant/model/tuple.dart';
import 'package:flutter/material.dart';

class DailyHadith extends StatefulWidget {
  const DailyHadith({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DailyHadithState();
  }
}

class _DailyHadithState extends State<DailyHadith> {
  Hadith hadith = Hadith();

  Tuple<String, String> getDailyHadith() {
    // Get the current date
    DateTime now = DateTime.now();

    // Use the current date to select a hadith from the list
    int index = now.day % hadith.hadithList.length;

    // Return the selected hadith
    return hadith.hadithList[index].getTuple();
  }

  @override
  Widget build(BuildContext context) {
    Tuple<String, String> dailyHadith = getDailyHadith();
    final String hadithText = dailyHadith.item1;
    final String hadithReference = dailyHadith.item2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon(Icons.format_quote),
        Image.asset(
          'assets/images/quote.png',
          height: 40,
        ),
        const Text('Daily Hadith',),
        Text(hadithText),
        Text(hadithReference),
      ],
    );
  }
}
