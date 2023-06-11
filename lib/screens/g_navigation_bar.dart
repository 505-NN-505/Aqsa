import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'Timepage.dart';
import 'tracker_page.dart';

class GNavigationBar extends StatefulWidget {
  const GNavigationBar({super.key});

  @override
  State<GNavigationBar> createState() => _GNavigationBarState();
}

class _GNavigationBarState extends State<GNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const TimePage(),
    const TrackerPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: _pages[_selectedIndex],

          // body: _pages[_selectedIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Container(
              
              color: Colors.black ,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 14),
                child: GNav(
                  gap: 8,
                  backgroundColor: Colors.black,
                  color: Colors.white,
                  activeColor: Colors.white,
                  tabBackgroundColor: Colors.grey.shade800,
                  padding: const EdgeInsets.all(16),
                  
                    tabs: const [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.calendar_month,
                        text: 'Tracker',
                      ),
                      GButton(
                        icon: Icons.settings,
                        text: 'Settings',
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    }),
              ),
            ),
          )),
    );
  }
}
