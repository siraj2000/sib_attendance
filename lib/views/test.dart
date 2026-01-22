// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:sib_attendance/models/attendance_model.dart';
// import 'package:sib_attendance/models/empolyee_models.dart';
// import 'package:sib_attendance/provider/attendance_provider.dart';
// import 'package:sib_attendance/provider/monthly_attendance_provider.dart';
// import 'package:sib_attendance/provider/user_provider.dart';
// import 'package:sib_attendance/utils/app_colors.dart';
// import 'package:sib_attendance/widget/custom_container.dart';
// import 'package:sib_attendance/widget/custom_text.dart';
// import 'package:sib_attendance/widget/search_text_field.dart';
// import 'package:sib_attendance/widget/test_widget.dart';

// class Test extends StatefulWidget {
//   const Test({super.key});

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: const Color(0xFFF5F6FA),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF1B2B4A),
//         title: CustomText(text: "My Attendance", color: Colors.grey, size: 14),

//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           children: [
//             TestWidget(),
//             // Top spacing replaced by Padding
//             Consumer<MonthlyAttendanceProvider>(
//               builder: (context, pro, child) {
//                 return SearchTextField(
//                   hintText: "Search .........",
//                   onChanged: (value) {
//                     pro.onSearchChanged(value); // ✅ هذا يخلي الرقم يتغير هنا

//                     context.read<AttendanceProvider>().fetchAttendance(
//                       monthlyProvider: pro,
//                       code: value, // ✅ يجيب حضور الموظف حسب التاريخ المختار
//                     );
//                   },
//                 );
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Consumer<MonthlyAttendanceProvider>(
//                 builder: (context, provider, child) {
//                   return Align(
//                     alignment: Alignment.centerLeft,
//                     child: CustomText(
//                       text: provider.searchText.isEmpty
//                           ? "Employee Code"
//                           : provider.searchText,

//                       size: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 10),
//             Consumer<MonthlyAttendanceProvider>(
//               builder: (context, provider, child) {
//                 return Row(
//                   children: [
//                     Expanded(
//                       flex: 4,
//                       child: TextFormField(
//                         readOnly: true,
//                         onTap: () async {
//                           await provider.pickDateRange(context);

//                           context.read<AttendanceProvider>().fetchAttendance(
//                             monthlyProvider: provider,
//                             code: provider
//                                 .employeeCode, // ✅ مهم: يعاود يجيب نفس الموظف بعد تغيير التاريخ
//                           );
//                         },
//                         decoration: InputDecoration(
//                           hintText:
//                               "${provider.range.start.day}/${provider.range.start.month}/${provider.range.start.year}  →  "
//                               "${provider.range.end.day}/${provider.range.end.month}/${provider.range.end.year}",
//                           suffixIcon: const Icon(
//                             Icons.date_range_outlined,
//                             color: Colors.grey,
//                           ),
//                           contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 14,
//                             vertical: 14,
//                           ),
//                           filled: true,
//                           fillColor: Colors.grey.shade100,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide.none,
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide.none,
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide.none,
//                           ),
//                           errorBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Align(
//                         alignment: Alignment.centerRight,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 10,
//                             vertical: 10,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade100,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: CustomText(
//                             text: "${provider.differenceInDays} Days",
//                             color: AppColors.primary,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),

//             //CustomContainer(),
//             Consumer<AttendanceProvider>(
//               builder: (context, provider, _) {
//                 if (provider.attendance.isEmpty) {
//                   return const Padding(
//                     padding: EdgeInsets.only(top: 20),
//                     child: Text("No attendance data"),
//                   );
//                 }

//                 return Column(
//                   children: provider.attendance.map((attendance) {
//                     return Padding(
//                       padding: const EdgeInsets.only(top: 12),
//                       child: CustomContainer(attendance: attendance),
//                     );
//                   }).toList(),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sib_attendance/models/attendance_model.dart';
import 'package:sib_attendance/provider/attendance_provider.dart';
import 'package:sib_attendance/provider/monthly_attendance_provider.dart';
import 'package:sib_attendance/utils/app_colors.dart';
import 'package:sib_attendance/widget/custom_container.dart';
import 'package:sib_attendance/widget/custom_text.dart';
import 'package:sib_attendance/widget/search_text_field.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  AttendanceModel? attendance;

  DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  DateTime _weekStart(DateTime d) {
    final date = _dateOnly(d);
    return date.subtract(Duration(days: date.weekday - 1)); // Monday
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B2B4A),
        title: CustomText(text: "My Attendance", color: Colors.grey, size: 14),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // TestWidget(),
            Row(
              children: [
                Expanded(
                  child: Consumer<MonthlyAttendanceProvider>(
                    builder: (context, pro, child) {
                      return SearchTextField(
                        hintText: "Search .........",
                        onChanged: (value) {
                          pro.onSearchChanged(value);

                          context.read<AttendanceProvider>().fetchAttendance(
                            monthlyProvider: pro,
                            code: value,
                          );
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Consumer<MonthlyAttendanceProvider>(
                      builder: (context, provider, child) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text: provider.searchText.isEmpty
                                ? "Employee Code"
                                : "Employee Code : ${provider.searchText}",
                            size: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Consumer<MonthlyAttendanceProvider>(
              builder: (context, provider, child) {
                return Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        readOnly: true,
                        onTap: () async {
                          await provider.pickDateRange(context);

                          context.read<AttendanceProvider>().fetchAttendance(
                            monthlyProvider: provider,
                            code: provider.employeeCode,
                          );
                        },
                        decoration: InputDecoration(
                          hintText:
                              "${provider.range.start.day}/${provider.range.start.month}/${provider.range.start.year}  →  "
                              "${provider.range.end.day}/${provider.range.end.month}/${provider.range.end.year}",
                          suffixIcon: const Icon(
                            Icons.date_range_outlined,
                            color: Colors.grey,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 14,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CustomText(
                            text: "${provider.differenceInDays} Days",
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            // CustomContainer(attendance: )

            // Consumer<AttendanceProvider>(
            //   builder: (context, pro, child) {
            //     final list = pro
            //         .attendance; // <-- إذا عندك pro.attendance List<AttendanceModel>
            //     if (list.isEmpty) return const SizedBox();

            //     return Column(
            //       children: list
            //           .map((e) => CustomContainer(attendance: e))
            //           .toList(),
            //     );
            //   },
            // ),

            //             Consumer<AttendanceProvider>(
            //   builder: (context, pro, child) {
            //     final list = pro
            //         .attendance; // <-- إذا عندك pro.attendance List<AttendanceModel>
            //     if (list.isEmpty) return const SizedBox();

            //     return Column(
            //       children: list
            //           .map((e) => CustomContainer(attendance: e))
            //           .toList(),
            //     );
            //   },
            // ),
            Consumer2<AttendanceProvider, MonthlyAttendanceProvider>(
              builder: (context, attPro, monthPro, _) {
                if (attPro.isLoading) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: CircularProgressIndicator(),
                  );
                }

                if (attPro.attendance.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("No attendance data"),
                  );
                }

                final selectedStart = _dateOnly(monthPro.range.start);
                final selectedEnd = _dateOnly(monthPro.range.end);

                // group by week
                final Map<DateTime, List<AttendanceModel>> weeks = {};

                for (final a in attPro.attendance) {
                  final ws = _weekStart(a.punchTime);
                  weeks.putIfAbsent(ws, () => []).add(a);
                }

                final weekKeys = weeks.keys.toList()..sort();

                return Column(
                  children: List.generate(weekKeys.length, (index) {
                    final ws = weekKeys[index];
                    final we = ws.add(const Duration(days: 6));

                    final weekStart = ws.isBefore(selectedStart)
                        ? selectedStart
                        : ws;
                    final weekEnd = we.isAfter(selectedEnd) ? selectedEnd : we;

                    // filter just in selected range (زيادة أمان)
                    final list = weeks[ws]!.where((e) {
                      final d = _dateOnly(e.punchTime);
                      return !d.isBefore(selectedStart) &&
                          !d.isAfter(selectedEnd);
                    }).toList();

                    if (list.isEmpty) return const SizedBox();

                    return Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: CustomContainer(
                        weekIndex: index + 1,
                        weekStart: weekStart,
                        weekEnd: weekEnd,
                        list: list,
                      ),
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
