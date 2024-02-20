import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:intl/intl.dart';
import 'package:vibration/vibration.dart';

void main() {
  runApp(const MaterialApp(
    home: AlarmPage(),
  ));
}

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  List<double> containerPositions = [];
  List<TimeOfDay> selectedTimes = [];
  List<bool> alarmStatus = [];
  bool showBlackContainer = false;

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = const IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    // You can navigate to a specific screen here or perform any action
  }

  Future<void> _scheduleNotification(TimeOfDay selectedTime) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'alarm_channel',
      'Alarm',
      'Alarm channel',
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('alarm_sound'),
      largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
    );
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    final localTimeZone = tz.getLocation('your_local_time_zone_here');

    final now = DateTime.now();
    final selectedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    final tz.TZDateTime scheduledDateTime =
    tz.TZDateTime.from(selectedDateTime, localTimeZone);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Alarm',
      'Time to wake up!',
      scheduledDateTime,
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );

    FlutterRingtonePlayer.playAlarm();

    // Check if the device has a vibrator before trying to vibrate
    bool? hasVibrator = await Vibration.hasVibrator();
    if (hasVibrator ?? false) {
      Vibration.vibrate(duration: 1000);
    }
  }




  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        containerPositions.add((containerPositions.length * 120).toDouble());
        selectedTimes.add(picked);
        alarmStatus.add(true);
        showBlackContainer = true;
      });
      _scheduleNotification(picked);
    }
  }

  void _deleteAlarm(int index) {
    setState(() {
      containerPositions.removeAt(index);
      selectedTimes.removeAt(index);
      alarmStatus.removeAt(index);
    });
    // Implement logic to cancel the scheduled notification
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          for (int index = 0; index < containerPositions.length; index++)
            Positioned(
              top: containerPositions[index],
              left: 15,
              child: Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.92,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.black, width: 2.0),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _deleteAlarm(index);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  selectedTimes.isNotEmpty &&
                                      index < selectedTimes.length
                                      ? '${DateFormat('hh:mm a').format(DateTime(2024, 1, 1, selectedTimes[index].hour, selectedTimes[index].minute))}'
                                      : 'No Time Set',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(child: Container()), // Spacer
                            Switch(
                              value: alarmStatus.isNotEmpty &&
                                  index < alarmStatus.length
                                  ? alarmStatus[index]
                                  : false,
                              onChanged: (bool value) {
                                setState(() {
                                  alarmStatus[index] = value;
                                });
                                // Implement logic to enable/disable the alarm
                              },
                              activeColor: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.blue,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  _selectTime(context);
                },
                iconSize: 48.0,
                tooltip: 'Set Alarm',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
