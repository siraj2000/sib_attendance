import 'package:flutter/material.dart';

import 'package:sib_attendance/views/employee_views.dart';
import 'package:sib_attendance/views/live_views.dart';
import 'package:sib_attendance/views/monthly_attendance_report.dart';

import 'package:sib_attendance/views/test.dart';
import 'package:sib_attendance/widget/custom_text.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,

      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            // ===== Title =====
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CustomText(
                text: "Sib Attendance",
                size: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),

            // ===== Lists (Dropdown) =====
            ExpansionTile(
              shape: Border.all(color: Colors.white),
              leading: const Icon(Icons.people_outline, color: Colors.indigo),
              title: CustomText(text: "Lists", size: 14),
              //title: Text(l10n.lists),
              trailing: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.indigo,
              ),
              childrenPadding: const EdgeInsets.only(left: 32),
              children: [
                drawerSubItem(
                  page: EmployeeViews(),
                  context,

                  // title: l10n.employees,
                  title: "Employees",
                ),
              ],
            ),
            // Divider(height: 1, color: Colors.green),
            // ===== Attendance (Dropdown) =====
            ExpansionTile(
              shape: Border.all(color: Colors.white),
              leading: const Icon(Icons.calendar_month, color: Colors.indigo),
              //title: Text(l10n.attendance),
              title: CustomText(text: "Attendance", size: 14),
              trailing: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.indigo,
              ),
              childrenPadding: const EdgeInsets.only(left: 32),
              children: [
                drawerSubItem(
                  page: const Test(),
                  //page: MonthlyAttendanceReport(),
                  context,
                  // title: l10n.monthlyAttendanceReport,
                  title: "Monthly Attendance Report",
                ),
                drawerSubItem(
                  page: const LiveViews(),
                  context,
                  // title: "Employee Attendance Tracking",
                  // title: l10n.liveScreen,
                  title: "Live Screen",
                ),
                // drawerSubItem(
                //   page: const HomeScreen(),
                //   context,
                //   //title: l10n.workSchedules,
                //   title: "Work Schedules",
                // ),
              ],
            ),

            // const Divider(height: 32),

            // // ===== Language Toggle =====
            // ListTile(
            //   leading: const Icon(Icons.language, color: Colors.indigo),
            //   title: Text(l10n.language),
            //   subtitle: Text(isArabic ? l10n.arabic : l10n.english),
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(12),
            //   ),
            //   tileColor: Colors.white,
            //   onTap: () {
            //     localeProvider.toggleLocale();
            //     Navigator.pop(context);
            //   },
            //   trailing: Icon(
            //     isArabic ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
            //     size: 16,
            //   ),
            // ),

            // ===== Synchronization (Dropdown) =====
            // ExpansionTile(
            //   shape: Border.all(color: Colors.white),
            //   leading: const Icon(Icons.sync, color: AppColors.primary),
            //   title: const Text("Synchronization"),
            //   trailing: const Icon(
            //     Icons.keyboard_arrow_down,
            //     color: Colors.indigo,
            //   ),
            //   childrenPadding: const EdgeInsets.only(left: 32),
            //   children: [
            //     drawerSubItem(
            //       context,
            //       title: "Management",
            //       page: SynchronizationViews(),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  // ===== Sub Item =====
  Widget drawerSubItem(
    BuildContext context, {
    required String title,
    required Widget page,
  }) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 14)),
      onTap: () {
        // Navigator.pop(context); // يقفل Drawer
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
