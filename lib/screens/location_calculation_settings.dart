import 'dart:convert';

import 'package:aqsa_muslim_prayer_assistant/screens/al_adhan_api/al_adhan_api.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/al_adhan_api/bloc/al_adhan_api_bloc.dart';
import 'package:aqsa_muslim_prayer_assistant/screens/g_navigation_bar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/districts_info/district.dart';
import '../model/districts_info/districts_info.dart';
import '../utilities/storage_service.dart';

class LocationCalculationController extends StatefulWidget {
  const LocationCalculationController({super.key});

  @override
  State<LocationCalculationController> createState() =>
      _LocationCalculationControllerState();
}

class _LocationCalculationControllerState
    extends State<LocationCalculationController> {
  late Future<List<District>> districtObject;

  late District? location;
  String calcMethod = "1";
  String asrCalculation = "0";

  Map<String?, String> calcMap = {};
  Map<String?, String> asrMap = {};

  Future<List<District>> fetchDistricts() async {
    var jsonText = await rootBundle.loadString('assets/bd_districts.json');
    var data = json.decode(jsonEncode(jsonText));
    DistrictsInfo districtsInfo = DistrictsInfo.fromJson(jsonDecode(data));
    return districtsInfo.districts ?? [];
  }

  @override
  void initState() {
    super.initState();

    districtObject = fetchDistricts();
    calcMap["University of Islamic Sciences, Karachi"] = "1";
    calcMap["Muslim World League"] = "3";
    calcMap["Islamic Society of North America"] = "2";
    calcMap["Egyptian General Authority of Survey"] = "5";
    asrMap["Shafi"] = "0";
    asrMap["Hanafi"] = "1";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(25),
            child: Image.asset(
              'assets/treasure-map.png',
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    enabled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    title: Text(
                      'Your Location',
                    ),
                    minVerticalPadding: 10,
                    subtitle: Text(
                      'Please select your district in Bangladesh.',
                    ),
                    titleTextStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
                    child: DropdownSearch<District>(
                      popupProps: PopupProps.bottomSheet(
                        searchDelay: Duration(seconds: 0),
                        showSearchBox: true,
                      ),
                      asyncItems: (String filter) => fetchDistricts(),
                      itemAsString: (District d) => d.name ?? "N/A",
                      onChanged: (District? data) {
                        location = data;
                      },
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "District",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue.withOpacity(0.8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    enabled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    title: Text(
                      'Prayer Time Calculation Method',
                    ),
                    minVerticalPadding: 10,
                    subtitle: Text(
                      'Please select the prayer time calculation method based on your country.',
                    ),
                    titleTextStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
                    child: Column(
                      children: [
                        DropdownSearch<String>(
                          popupProps: PopupProps.bottomSheet(
                            constraints: const BoxConstraints(maxHeight: 220),
                          ),
                          items: [
                            "University of Islamic Sciences, Karachi",
                            "Muslim World League",
                            "Islamic Society of North America",
                            "Egyptian General Authority of Survey"
                          ],
                          selectedItem:
                              "University of Islamic Sciences, Karachi",
                          onChanged: (String? data) {
                            calcMethod = calcMap[data]!;
                          },
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Calculation Method",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue.withOpacity(0.8),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.8),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DropdownSearch<String>(
                          popupProps: PopupProps.bottomSheet(
                            constraints: const BoxConstraints(maxHeight: 120),
                          ),
                          items: [
                            "Hanafi",
                            "Shafi",
                          ],
                          selectedItem: "Shafi",
                          onChanged: (String? data) {
                            asrCalculation = asrMap[data]!;
                          },
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Asr Method",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue.withOpacity(0.8),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.8),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          FloatingActionButton(
              child: Icon(CupertinoIcons.arrow_right),
              onPressed: () async {
           
                await SecureStorage.set("location", location!.name);
                await SecureStorage.set("calcMethod", calcMethod);
                await SecureStorage.set("schoolMethod", asrCalculation);

                context.read<AlAdhanApiBloc>().add(
                      GetTimings(
                          longitude: location?.long,
                          latitude: location?.lat,
                          calcMethod: calcMethod,
                          schoolMethod: asrCalculation),
                    );
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GNavigationBar(),
                ));
              })
        ],
      ),
    );
  }
}
