import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sib_attendance/provider/attendance_provider.dart';
import 'package:sib_attendance/provider/live_provider.dart';
import 'package:sib_attendance/provider/monthly_attendance_provider.dart';
import 'package:sib_attendance/provider/user_provider.dart';
import 'package:sib_attendance/widget/custom_text.dart';

class DashboradViews extends StatefulWidget {
  const DashboradViews({super.key});

  @override
  State<DashboradViews> createState() => _DashboradViewsState();
}

class _DashboradViewsState extends State<DashboradViews> {
  @override
  void initState() {
    super.initState();

    /// أول تحميل بدون قيم ثابتة
    Future.microtask(() {
      context.read<UserProvider>().fetchUsers();
      context.read<LiveProvider>().fetchLive();
      context.read<AttendanceProvider>().fetchAttendance(
        monthlyProvider: MonthlyAttendanceProvider(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.withOpacity(0.6)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<UserProvider>(
                        builder: (context, provider, child) {
                          return CustomText(
                            text: provider.users.length.toString(),
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: CustomText(
                          text: "Total Empolyee",
                          color: Colors.grey,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.purple.withOpacity(0.6)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<LiveProvider>(
                        builder: (context, provider, child) {
                          return CustomText(
                            text: provider.inside.toString(),
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            size: 20,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: CustomText(
                          text: "Inside Company",
                          color: Colors.grey,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red.withOpacity(0.6)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<LiveProvider>(
                        builder: (context, provider, child) {
                          return CustomText(
                            text: provider.outside.toString(),
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            size: 20,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: CustomText(
                          text: "Outside Company",
                          color: Colors.grey,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.orange.withOpacity(0.6)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "2", color: Colors.orange, size: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: CustomText(
                          text: "Device",
                          color: Colors.grey,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
