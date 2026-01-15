// import 'package:flutter/material.dart';

// import 'package:sib_attendance/utils/app_colors.dart';
// import 'package:sib_attendance/widget/custom_text.dart';
// import 'package:sib_attendance/widget/mothly_attendance_item.dart';

// class MonthlyAttendanceReport extends StatefulWidget {
//   const MonthlyAttendanceReport({super.key});

//   @override
//   State<MonthlyAttendanceReport> createState() =>
//       _MonthlyAttendanceReportState();
// }

// class _MonthlyAttendanceReportState extends State<MonthlyAttendanceReport> {
//   TextEditingController searchController = TextEditingController();

//   DateTimeRange dateTimeRange = DateTimeRange(
//     start: DateTime.now(),
//     end: DateTime.now(),
//   );

//   Future<void> pickDataRange() async {
//     DateTimeRange? picked = await showDateRangePicker(
//       context: context,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//       initialDateRange: dateTimeRange,
//     );
//     if (picked == null) return;
//     setState(() {
//       dateTimeRange = picked;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final difference = dateTimeRange.duration;
//     return Scaffold(
//       appBar: AppBar(
//         title: CustomText(text: "Monthly Attendance Report", size: 14),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: TextFormField(
//                 controller: searchController,
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.symmetric(
//                     horizontal: 10,
//                     vertical: 15,
//                   ),

//                   prefixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey.shade300),
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                   hintText: "Department",
//                 ),
//                 onChanged: (value) => setState(() {}),
//               ),
//             ),
//             SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: CustomText(
//                   text: searchController.value.text.trim().isEmpty
//                       ? "Employee Name"
//                       : searchController.value.text,
//                   color: Colors.black,
//                   size: 15,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 //mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Expanded(
//                     flex: 3,
//                     child: ElevatedButton(
//                       onPressed: pickDataRange,

//                       child: Text(
//                         "${dateTimeRange.start.day}/${dateTimeRange.start.month}/${dateTimeRange.start.year}",
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Expanded(
//                     flex: 3,
//                     child: ElevatedButton(
//                       onPressed: pickDataRange,
//                       child: Text(
//                         "${dateTimeRange.end.day}/${dateTimeRange.end.month}/${dateTimeRange.end.year}",
//                       ),
//                     ),
//                   ),
//                   Spacer(),
//                   CustomText(
//                     text: "${difference.inDays} days",
//                     color: AppColors.primary,
//                     size: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ],
//               ),
//             ),
//             ListView.separated(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,

//               itemBuilder: (context, index) => MothlyAttendanceItem(),
//               separatorBuilder: (context, index) => SizedBox(height: 6),
//               itemCount: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sib_attendance/models/attendance_model.dart';
// import 'package:sib_attendance/provider/attendance_provider.dart';
// import 'package:sib_attendance/provider/monthly_attendance_provider.dart';
// import 'package:sib_attendance/provider/user_provider.dart';

// import 'package:sib_attendance/utils/app_colors.dart';
// import 'package:sib_attendance/widget/custom_text.dart';
// import 'package:sib_attendance/widget/mothly_attendance_item.dart';

// class MonthlyAttendanceReport extends StatefulWidget {
//   const MonthlyAttendanceReport({super.key});

//   @override
//   State<MonthlyAttendanceReport> createState() =>
//       _MonthlyAttendanceReportState();
// }

// class _MonthlyAttendanceReportState extends State<MonthlyAttendanceReport> {
//   @override

// @override
// void initState() {
//   super.initState();

//   Future.microtask(() {
//     final monthlyProvider =
//         context.read<MonthlyAttendanceProvider>();

//     context.read<AttendanceProvider>().fetchAttendance(
//       monthlyProvider: monthlyProvider,
//     );
//   });
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: CustomText(text: "Monthly Attendance Report", size: 14),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 10),

//             /// Search
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: Consumer<MonthlyAttendanceProvider>(
//                 builder: (context, provider, child) {
//                   return TextFormField(
//                     controller: provider.searchController,
//                     decoration: InputDecoration(
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 10,
//                         vertical: 15,
//                       ),
//                       prefixIcon: const Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey.shade300),
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       hintText: "Enter The Number Of Employee",
//                     ),
//                     onChanged: provider.onSearchChanged,
//                   );
//                 },
//               ),
//             ),

//             const SizedBox(height: 10),

//             /// Employee Name
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Consumer<MonthlyAttendanceProvider>(
//                 builder: (context, provider, child) {
//                   return Align(
//                     alignment: Alignment.centerLeft,
//                     child: CustomText(
//                       text: provider.searchText.isEmpty
//                           ? "Employee Name"
//                           : provider.searchText,
//                       color: Colors.black,
//                       size: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   );
//                 },
//               ),
//             ),

//             const SizedBox(height: 10),

//             /// Date Range
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Consumer<MonthlyAttendanceProvider>(
//                 builder: (context, provider, child) {
//                   return Row(
//                     children: [
//                       Expanded(
//                         flex: 3,
//                         child: ElevatedButton(
//                           onPressed: () => provider.pickDateRange(context),
//                           child: Text(
//                             "${provider.range.start.day}/${provider.range.start.month}/${provider.range.start.year}",
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         flex: 3,
//                         child: ElevatedButton(
//                           onPressed: () => provider.pickDateRange(context),
//                           child: Text(
//                             "${provider.range.end.day}/${provider.range.end.month}/${provider.range.end.year}",
//                           ),
//                         ),
//                       ),
//                       const Spacer(),
//                       CustomText(
//                         text: "${provider.differenceInDays} days",
//                         color: AppColors.primary,
//                         size: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),

//             /// Attendance List
//             // Consumer<UserProvider>(
//             //   builder: (context, provider, child) {
//             //     if (provider.isLoading) {
//             //       return const Padding(
//             //         padding: EdgeInsets.all(20),
//             //         child: CircularProgressIndicator(),
//             //       );
//             //     }

//             //     return ListView.separated(
//             //       physics: const NeverScrollableScrollPhysics(),
//             //       shrinkWrap: true,
//             //       itemBuilder: (context, index) {
//             //         return const MothlyAttendanceItem();
//             //       },
//             //       separatorBuilder: (context, index) =>
//             //           const SizedBox(height: 6),
//             //       itemCount: 5,
//             //     );
//             //   },
//             // ),
//             Consumer<AttendanceProvider>(
//               builder: (context, provider, child) {
//                 if (provider.isLoading) {
//                   return const Padding(
//                     padding: EdgeInsets.all(20),
//                     child: CircularProgressIndicator(),
//                   );
//                 }

//                 if (provider.attendance.isEmpty) {
//                   return const Padding(
//                     padding: EdgeInsets.all(20),
//                     child: CustomText(text: "No attendance found"),
//                   );
//                 }

//                 return ListView.separated(
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: provider.attendance.length,
//                   separatorBuilder: (context, index) =>
//                       const SizedBox(height: 6),
//                   itemBuilder: (context, index) {
//                     return MothlyAttendanceItem(
//                       attendance: provider.attendance[index],
//                     );
//                   },
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
import 'package:sib_attendance/provider/user_provider.dart';
import 'package:sib_attendance/utils/app_colors.dart';
import 'package:sib_attendance/widget/custom_text.dart';
import 'package:sib_attendance/widget/mothly_attendance_item.dart';
import 'package:sib_attendance/widget/search_text_field.dart';
import 'package:sib_attendance/widget/test_widget.dart';

class MonthlyAttendanceReport extends StatefulWidget {
  const MonthlyAttendanceReport({super.key});

  @override
  State<MonthlyAttendanceReport> createState() =>
      _MonthlyAttendanceReportState();
}

class _MonthlyAttendanceReportState extends State<MonthlyAttendanceReport> {
  @override
  void initState() {
    super.initState();

    /// أول تحميل بدون قيم ثابتة
    Future.microtask(() {
      context.read<UserProvider>().fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Monthly Attendance Report", size: 14),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            /// 🔍 Search Employee Code
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Consumer<MonthlyAttendanceProvider>(
            //     builder: (context, provider, child) {
            //       return TextFormField(
            //         controller: provider.searchController,
            //         decoration: InputDecoration(
            //           contentPadding: const EdgeInsets.symmetric(
            //             horizontal: 10,
            //             vertical: 15,
            //           ),
            //           prefixIcon: const Icon(Icons.search),
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(18),
            //           ),
            //           hintText: "Enter Employee Code",
            //         ),
            //         onChanged: (value) {
            //           provider.onSearchChanged(value);

            //           context.read<AttendanceProvider>().fetchAttendance(
            //             monthlyProvider: provider,
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),
            Consumer<MonthlyAttendanceProvider>(
              builder: (context, pro, child) {
                return SearchTextField(
                  hintText: "Search .........",
                  onChanged: (value) {
                    context.read<AttendanceProvider>().fetchAttendance(
                      monthlyProvider: pro,
                      code: value,
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 10),

            /// 👤 Employee Name / Code
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Consumer<MonthlyAttendanceProvider>(
                builder: (context, provider, child) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: provider.searchText.isEmpty
                          ? "Employee Code"
                          : provider.searchText,
                      size: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            /// 📅 Date Range
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Consumer<MonthlyAttendanceProvider>(
                builder: (context, provider, child) {
                  return Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            await provider.pickDateRange(context);
                            context.read<AttendanceProvider>().fetchAttendance(
                              monthlyProvider: provider,
                            );
                          },
                          child: Text(
                            "${provider.range.start.day}/${provider.range.start.month}/${provider.range.start.year}",
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            await provider.pickDateRange(context);
                            context.read<AttendanceProvider>().fetchAttendance(
                              monthlyProvider: provider,
                            );
                          },
                          child: Text(
                            "${provider.range.end.day}/${provider.range.end.month}/${provider.range.end.year}",
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      CustomText(
                        text: "${provider.differenceInDays} days",
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            /// 📋 Attendance List
            Consumer<AttendanceProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  );
                }

                if (provider.attendance.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(20),
                    child: CustomText(text: "Serach The Empolyee"),
                  );
                }

                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: provider.attendance.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 6),
                  itemBuilder: (context, index) {
                    // Group attendance by date
                    final groupedByDate = <String, List<dynamic>>{};
                    for (var att in provider.attendance) {
                      final dateKey = DateTime(
                        att.punchTime.year,
                        att.punchTime.month,
                        att.punchTime.day,
                      ).toIso8601String();
                      groupedByDate.putIfAbsent(dateKey, () => []).add(att);
                    }

                    // Only show the first and last record of each day (if they are different)
                    final displayList = <AttendanceModel>[];
                    groupedByDate.forEach((_, list) {
                      if (list.length == 1) {
                        displayList.add(list.first);
                      } else if (list.length > 1) {
                        displayList.add(list.first);
                        if (list.last != list.first) {
                          displayList.add(list.last);
                        }
                      }
                    });

                    if (index < displayList.length) {
                      // For each pair of first/last for a day, even indexes are check in, odd are check out
                      bool isCheckIn = index % 2 == 0;
                      return MothlyAttendanceItem(
                        attendance: displayList[index],
                        isCheckIn: isCheckIn,
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
