import 'package:flutter/material.dart';
import 'package:meditation_friend_app/src/home/widgets/attendance_calendar.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('명상달력')),
      body: AttendanceCalendar(),
    );
  }
}
