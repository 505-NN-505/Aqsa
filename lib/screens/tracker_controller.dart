import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TrackerController with ChangeNotifier {
  final storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));
  double _progress = 0;
  int _count = 0;
  List<bool> _prayerCompletion = List.generate(5, (index) => false);

  double get progress => _progress;
  int get count => _count;

  bool prayerCompletion(int index) {
    return _prayerCompletion[index];
  }

  Future<void> loadValues() async {
    try {
      final progressValue = await storage.read(key: 'progress');
      final countValue = await storage.read(key: 'count');
      final prayerCompletionValue = await storage.read(key: 'prayerCompletion');

      if (progressValue != null) {
        _progress = double.parse(progressValue);
      }
      if (countValue != null) {
        _count = int.parse(countValue);
      }
      if (prayerCompletionValue != null) {
        _prayerCompletion = List<bool>.from(json.decode(prayerCompletionValue));
      }
    } catch (e) {
      // Handle any errors while loading values from storage
      print('Error loading values from storage: $e');
    }
  }

  Future<void> saveValues() async {
    try {
      await storage.write(key: 'progress', value: _progress.toString());
      await storage.write(key: 'count', value: _count.toString());
      await storage.write(key: 'prayerCompletion', value: json.encode(_prayerCompletion));
    } catch (e) {
      // Handle any errors while saving values to storage
      print('Error saving values to storage: $e');
    }
  }

  void setScore(double value) {
    _progress = value;
    notifyListeners();
    saveValues();
  }

  void setCount(int value) {
    _count = value;
    notifyListeners();
    saveValues();
  }

  void updateCompletion(int index, bool value) {
    _prayerCompletion[index] = value;
    notifyListeners();
    saveValues();
  }
}
