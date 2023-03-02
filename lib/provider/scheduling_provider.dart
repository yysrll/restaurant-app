import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/background_service.dart';
import 'package:restaurant_app/utils/date_time_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SchedulingProvider extends ChangeNotifier {
  static const String isScheduledKey = 'isScheduledPref';
  bool _isScheduled = false;
  bool get isScheduled => _isScheduled;

  SchedulingProvider() {
    getScheduledStatus();
  }

  Future<void> getScheduledStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isScheduled = prefs.getBool(isScheduledKey) ?? false;
    notifyListeners();
  }

  Future<bool> scheduledRestaurant(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(isScheduledKey, value);
    _isScheduled = value;
    if (_isScheduled) {
      print("Scheduling restaurant activated");
      notifyListeners();
      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      print('Scheduling News Canceled');
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
