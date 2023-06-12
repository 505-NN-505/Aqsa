import 'package:aqsa_muslim_prayer_assistant/screens/calender.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/al_adhan_api/bloc/al_adhan_api_bloc.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/al_adhan_api/controller/api_repositories.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/linear_progress_tracker.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/g_navigation_bar.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/tracker_page.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/timepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/prayer_tracker.dart';
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
    return BlocProvider<AlAdhanApiBloc>(
      create: (context) => AlAdhanApiBloc(apiRepository: ApiRepository()),
      child: MaterialApp(
        home: const LocationCalculationController(),
        theme: ThemeData.dark(),
      ),
    );
  }
}
