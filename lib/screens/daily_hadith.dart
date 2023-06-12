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
    const TextStyle customTextStyle = TextStyle(
      color: Color.fromARGB(251, 119, 207, 231),
      fontSize: 15,
    );

    Tuple<String, String> dailyHadith = getDailyHadith();
    final String hadithText = dailyHadith.item1;
    final String hadithReference = dailyHadith.item2;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon(Icons.format_quote),
          Image.asset(
            'assets/images/quote.png',
            height: 40,
            color: const Color.fromARGB(251, 119, 207, 231),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              'Daily Hadith',
              style: TextStyle(
                color: Color.fromARGB(251, 119, 207, 231),
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),

          Text(
            hadithText,
            style: customTextStyle,
          ),
          const SizedBox(
            height: 18,
          ),
          Text(hadithReference, style: customTextStyle),
        ],
      ),
    );
  }
}
