import 'package:aqsa_muslim_prayer_assistant/screens/main_page.dart';
import 'package:flutter/material.dart';

import 'model/api_testing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HomePage());
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
      home: ApiTesting(),
    );
  }
}
