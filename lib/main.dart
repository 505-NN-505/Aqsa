import 'package:aqsa_muslim_prayer_assistant/screens/al_adhan_api/bloc/al_adhan_api_bloc.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/al_adhan_api/controller/api_repositories.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/g_navigation_bar.dart';
import 'package:aqsa_muslim_prayer_assistant/utilities/secured_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/location_calculation_settings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: ThemeData().copyWith(useMaterial3: true),
    // home: const TimePage(),
    home: HomePage(),
  ));
  // runApp(const MainPage());
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  late SecureStorage storage;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.storage = SecureStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlAdhanApiBloc>(
      create: (context) => AlAdhanApiBloc(apiRepository: ApiRepository()),
      child: MaterialApp(
        // home: widget.storage.get("location").toString == ""
        //     ? LocationCalculationController()
        //     : GNavigationBar(),
        home: LocationCalculationController(),
        theme: ThemeData.dark(),
      ),
    );
  }
}
