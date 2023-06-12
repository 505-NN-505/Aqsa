import 'package:aqsa_muslim_prayer_assistant/screens/daily_hadith.dart';
import 'package:flutter/material.dart';

class TimePage extends StatefulWidget {
  const TimePage({super.key});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prayer Tracker',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: ListView(
      children: [
        Row(children: [
          SizedBox(width: 20,),
          Container(child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Now: Duhur', style: TextStyle(fontSize: 20)),

            Text.rich(
    TextSpan(
      style: TextStyle(color: Colors.redAccent), //apply style to all
      children: [
      TextSpan(text: '11:57', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
      TextSpan(text: ' AM', style: TextStyle(fontSize: 15)),
      TextSpan(text: '(start time)', ),
      
    ]
  )
),

            Text('11:57 AM (start time)'),
            Text('3 hour left'),
            Text('Suhur : 3:43 AM'),
            Text('Iftar : 3:43 AM'),
            
          ]),),
          SizedBox(width: 20,),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assets/images/mosque.png',
                    color: Colors.indigo[800],
                    height: 180,
                  ),
                ),

        ],),
        const DailyHadith(),
      ],
    ),
      ),
    );
 
  }
}



