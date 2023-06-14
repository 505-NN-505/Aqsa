import 'package:aqsa_muslim_prayer_assistant/screens/al_adhan_api/bloc/al_adhan_api_bloc.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/al_adhan_api/controller/api_repositories.dart';
import 'package:aqsa_muslim_prayer_assistant/utilities/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/location_calculation_settings.dart';
import 'package:provider/provider.dart';

import 'screens/tracker_controller.dart';

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

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  var valueLocation = "";

  Future getStorageLocation() async {
    var str = await SecureStorage.get("location");
    setState(() {
      valueLocation = str;
    });
  }

  void initState() {
    getStorageLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlAdhanApiBloc>(
      create: (context) => AlAdhanApiBloc(apiRepository: ApiRepository()),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TrackerController()),
        ],
        child: MaterialApp(
            home: LocationCalculationController(),
            theme: ThemeData.dark(),
        ),
      )
    );
  }
}