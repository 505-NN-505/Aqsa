import 'package:aqsa_muslim_prayer_assistant/screens/g_navigation_bar.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/main_page.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/navigation_bottom_bar.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/timepage.dart';
import 'package:flutter/material.dart';

import 'model/api_testing.dart';
import 'screens/location_calculation_settings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: ThemeData().copyWith(useMaterial3: true),
    // home: const TimePage(),
    home: const HomePage(),
  ));
  // runApp(const MainPage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationCalculationController(),
      theme: ThemeData.dark(),
    );
  }
}
