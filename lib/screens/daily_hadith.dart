import 'package:aqsa_muslim_prayer_assistant/utilities/hadith.dart';
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
      color: Color.fromARGB(249, 147, 209, 226),
      fontSize: 15,
      fontWeight: FontWeight.w800,
    );

    Tuple<String, String> dailyHadith = getDailyHadith();
    final String hadithText = dailyHadith.item1;
    final String hadithReference = dailyHadith.item2;
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon(Icons.format_quote),
            Image.asset(
              'assets/images/quote.png',
              height: 40,
              color: Colors.orange,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Daily Hadith',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
