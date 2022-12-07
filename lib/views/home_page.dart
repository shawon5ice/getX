import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/controllers/alarm_controller.dart';
import 'package:learning_getx/models/alarm_info.dart';
import 'package:meta/meta.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final alarmController = Get.put(AlarmController());
  bool _customTileExpanded = false;
  TimeOfDay time = TimeOfDay.now()
      .replacing(hour: DateTime.now().hour, minute: DateTime.now().minute);
  final GlobalKey expansionTile = GlobalKey();

  void onTimeChanged(TimeOfDay newTime) {
    // setState(() {
    //   times.add(newTime);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GetX<AlarmController>(builder: (alarmController) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 8, left: 8, right: 8),
            child: ListView.builder(
              itemCount: alarmController.alarms.length,
              itemBuilder: (context, index) {
                AlarmInfo alarmInfo = alarmController.alarms[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 16, right: 16, left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: '${alarmInfo.hour}:${alarmInfo.minute}',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 64),
                                children: [
                                  TextSpan(
                                    text: alarmInfo.isAm ? 'AM' : 'PM',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            CupertinoSwitch(
                                activeColor: Colors.deepPurple,
                                value: alarmInfo.isOn,
                                onChanged: (value) {
                                  alarmController.toggleAlarm(alarmInfo);
                                }),
                          ],
                        ),
                        ExpansionTile(
                          title: _customTileExpanded
                              ? SizedBox()
                              : Text('Everyday'),
                          trailing: Icon(
                            _customTileExpanded
                                ? Icons.arrow_drop_down_circle
                                : Icons.arrow_drop_down,
                          ),
                          children: <Widget>[
                            Container(
                                height: 300,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        for (var day in alarmController.daysSortForm)
                                          GestureDetector(
                                            onTap: () {
                                              alarmController.toggleDay(
                                                  alarmInfo, day);
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: alarmInfo.repeatDays.contains(day)?Colors.blue:Colors.grey,
                                              child: Text(
                                                day[0],
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    SizedBox(
                                      height: 24,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            child: Row(children: [
                                              Icon(Icons.add_alert),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('Default')
                                            ]),
                                          ),
                                          SizedBox(
                                            child: Row(children: [
                                              Checkbox(
                                                  value: false,
                                                  onChanged: (value) {}),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('Vibrate')
                                            ]),
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text('Level'),
                                            content: TextField(
                                              decoration: InputDecoration(
                                                  hintText: 'Label',
                                                  border: InputBorder.none),
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {},
                                                  child: Text('Cancel')),
                                              TextButton(
                                                  onPressed: () {},
                                                  child: Text('Save'))
                                            ],
                                          ),
                                        );
                                      },
                                      child: ListTile(
                                        leading:
                                            Icon(Icons.double_arrow_rounded),
                                        title: Text('Level'),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: ListTile(
                                        leading:
                                            Icon(Icons.double_arrow_rounded),
                                        title: Text('Label'),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                          onExpansionChanged: (bool expanded) {
                            // setState(() =>
                            // _customTileExpanded = expanded);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        floatingActionButton: Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              onPressed: () {
                // show time picker dialog
                Navigator.of(context).push(
                  showPicker(
                    context: context,
                    value: time,
                    onChange: (TimeOfDay newTime) {
                      alarmController.addAlarm(newTime);
                    },
                  ),
                );
              },
              child: const Icon(Icons.add),
            )),
      );
    });
  }
}
