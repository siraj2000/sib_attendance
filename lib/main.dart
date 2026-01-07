import 'package:flutter/material.dart';
import 'package:sib_attendance/utils/app_colors.dart';
import 'package:sib_attendance/views/employee_views.dart';
import 'package:sib_attendance/views/home_views.dart';

import 'package:sib_attendance/widget/tab_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: AppColors.primary),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
      //home: MonthlyAttendanceRange(),
      // home: const SynchronizationViews(),
      // home: const MonthlyAttendanceReport(),
    );
  }
}
