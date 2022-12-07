import 'package:flutter/src/material/time.dart';
import 'package:get/get.dart';
import 'package:learning_getx/models/alarm_info.dart';

class AlarmController extends GetxController {
  var alarms = <AlarmInfo>[].obs;
  List<String> daysSortForm  = [  'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat',];

  @override
  void onInit() {
    super.onInit();
    fetchAlarms();
  }

  void fetchAlarms() async{
    await Future.delayed(const Duration(seconds: 1));
    var alarmsList = <AlarmInfo>[
      AlarmInfo(
        hour: '12',
        minute: '00',
        repeatDays: ['Mon', 'Wed', 'Thu', 'Fri'],
        isOn: true,
        level: '1',
        sound: '1',
        isAm: true,
      ),
      AlarmInfo(
        hour: '12',
        minute: '00',
        repeatDays: ['Mon', 'Wed', 'Fri'],
        isOn: false,
        level: '1',
        sound: '1',
        isAm: false,
      ),
      AlarmInfo(
        hour: '12',
        minute: '00',
        repeatDays: ['Mon', 'Wed', 'Thu', 'Fri'],
        isOn: true,
        level: '1',
        sound: '1',
        isAm: true,
      ),
    ];
    alarms.value = alarmsList;
  }

  void toggleAlarm(AlarmInfo alarmInfo) {
    alarmInfo.isOn = !alarmInfo.isOn;
    alarms.refresh();
  }

  void addAlarm(TimeOfDay newTime) {
    alarms.add(AlarmInfo(
      hour: newTime.hour.toString(),
      minute: newTime.minute.toString(),
      repeatDays: ['S', 'T', 'W', 'F',],
      isOn: true,
      level: '1',
      sound: '1',
      isAm: true,
    ));
  }

  void toggleDay(AlarmInfo alarmInfo, String day) {
    if(alarmInfo.repeatDays.contains(day)){
      alarmInfo.repeatDays.remove(day);
    }else{
      alarmInfo.repeatDays.add(day);
    }
    if(alarmInfo.repeatDays.length == 0){
      alarmInfo.isOn = false;
    }
    alarms.refresh();
  }
}