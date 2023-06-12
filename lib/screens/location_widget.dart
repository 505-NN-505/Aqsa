import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/districts_info/district.dart';
import '../model/districts_info/districts_info.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  late Future<List<District>> districtObject;

  late District? location;
  Map<String?, String> calcMap = {};

  Future<List<District>> fetchDistricts() async {
    var jsonText = await rootBundle.loadString('assets/bd_districts.json');
    var data = json.decode(jsonEncode(jsonText));
    DistrictsInfo districtsInfo = DistrictsInfo.fromJson(jsonDecode(data));
    return districtsInfo.districts ?? [];
  }

  @override
  void initState() {
    districtObject = fetchDistricts();
    calcMap["University of Islamic Sciences, Karachi"] = "1";
    calcMap["Muslim World League"] = "3";
    calcMap["Islamic Society of North America"] = "2";
    calcMap["Egyptian General Authority of Survey"] = "5";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              titleTextStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
              child: DropdownSearch<District>(
                popupProps: PopupProps.bottomSheet(
                  searchDelay: Duration(seconds: 0),
                  showSearchBox: true,
                ),
                asyncItems: (String filter) => fetchDistricts(),
                itemAsString: (District d) => d.name ?? "Dhaka",
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
    );
  }
}
