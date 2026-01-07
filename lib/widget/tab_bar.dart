import 'package:flutter/material.dart';
import 'package:sib_attendance/views/monthly_attendance_range.dart';
import 'package:sib_attendance/views/monthly_attendance_report.dart';
import 'package:sib_attendance/widget/custom_text.dart';

class MonthlyAttendanceTabs extends StatelessWidget {
  const MonthlyAttendanceTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: "Monthly Attendance",
            size: 16,
            color: Colors.white,
          ),
          bottom: const TabBar(
            padding: EdgeInsets.symmetric(horizontal: 16),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: "Monthly Report"),
              Tab(text: "Date Range"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [MonthlyAttendanceReport(), MonthlyAttendanceRange()],
        ),
      ),
    );
  }
}
