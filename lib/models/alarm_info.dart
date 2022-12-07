
class AlarmInfo{
  final String hour;
  final String minute;
  final List<String> repeatDays;
  bool isOn;
  final String level;
  final String sound;
  final bool isAm;

  AlarmInfo({
    required this.hour,
    required this.minute,
    required this.repeatDays,
    required this.isOn,
    required this.level,
    required this.sound,
    required this.isAm,
  });
}