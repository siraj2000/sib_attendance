// import 'package:flutter/material.dart';
// import 'package:sib_attendance/widget/custom_text.dart';

// class CustomContainer extends StatelessWidget {
//   const CustomContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 16),
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 const CustomText(
//                   text: "Week 1",
//                   //color: Colors.grey,
//                   size: 14,
//                   fontWeight: FontWeight.w600,
//                 ),

//                 Container(width: 8),
//                 const CustomText(
//                   text: "07-13 Jan",
//                   color: Colors.grey,
//                   size: 14,
//                 ),

//                 const Spacer(),
//                 IconButton(
//                   onPressed: () {},
//                   icon: const Icon(Icons.keyboard_arrow_down),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 12),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade200,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Column(
//                           children: const [
//                             CustomText(text: "07", size: 14),
//                             // Replace as requested
//                             CustomText(
//                               text: "wen",
//                               color: Colors.grey,
//                               size: 14,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(width: 12),
//                       Expanded(
//                         child: Column(
//                           children: [
//                             const Icon(
//                               Icons.login,
//                               size: 18,
//                               color: Colors.grey,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 4),
//                               child: CustomText(
//                                 text: "09:00 AM",

//                                 size: 14,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             CustomText(
//                               text: "Check in",
//                               color: Colors.grey,
//                               size: 12,
//                             ),
//                             //
//                           ],
//                         ),
//                       ),
//                       Container(width: 1, height: 40, color: Colors.black12),
//                       Expanded(
//                         child: Column(
//                           children: const [
//                             Icon(Icons.logout, size: 18, color: Colors.grey),
//                             Padding(
//                               padding: EdgeInsets.only(top: 4),
//                               child: CustomText(
//                                 text: "05:00 PM",

//                                 size: 14,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             CustomText(
//                               text: "Check out",
//                               color: Colors.grey,
//                               size: 12,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(width: 1, height: 40, color: Colors.black12),
//                       Expanded(
//                         child: Column(
//                           children: const [
//                             Icon(Icons.timelapse, size: 18, color: Colors.grey),
//                             Padding(
//                               padding: EdgeInsets.only(top: 4),
//                               child: CustomText(
//                                 text: "7h:50M",

//                                 size: 13,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             CustomText(
//                               text: "Total Hours",
//                               color: Colors.grey,
//                               size: 12,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 8),
//                     child: Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade200,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Column(
//                             children: const [
//                               Text(
//                                 "13",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               // Replace as requested
//                               CustomText(
//                                 text: "Wen",
//                                 color: Colors.grey,
//                                 size: 14,
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(width: 12),
//                         Expanded(
//                           child: Column(
//                             children: const [
//                               Icon(Icons.login, size: 18, color: Colors.grey),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 4),
//                                 child: CustomText(
//                                   text: "09:00 AM",

//                                   size: 14,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               Text(
//                                 "Check in",
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(width: 1, height: 40, color: Colors.black12),
//                         Expanded(
//                           child: Column(
//                             children: const [
//                               Icon(Icons.logout, size: 18, color: Colors.grey),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 4),
//                                 child: Text(
//                                   "05:00 PM",
//                                   style: TextStyle(fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Text(
//                                 "Check out",
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(width: 1, height: 40, color: Colors.black12),
//                         Expanded(
//                           child: Column(
//                             children: const [
//                               Icon(
//                                 Icons.timelapse,
//                                 size: 18,
//                                 color: Colors.grey,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 4),
//                                 child: Text(
//                                   "7h 50m",
//                                   style: TextStyle(fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Text(
//                                 "Total Hours",
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:sib_attendance/models/attendance_model.dart';
// import 'package:sib_attendance/provider/monthly_attendance_provider.dart';
// import 'package:sib_attendance/provider/user_provider.dart';
// import 'package:sib_attendance/widget/custom_text.dart';

// class CustomContainer extends StatefulWidget {
//  const CustomContainer({super.key, required this.attendance,});
//   final AttendanceModel attendance;

//   @override
//   State<CustomContainer> createState() => _CustomContainerState();
// }

// class _CustomContainerState extends State<CustomContainer> {
//   bool _isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     final date = widget.attendance.punchTime;
//     final day = DateFormat('dd').format(date);
//     final month = DateFormat('MMM').format(date);
//     final time = DateFormat('hh:mm a').format(date);
//     final users = context.watch<UserProvider>().users;
//     return SingleChildScrollView(
//       child: ExpansionPanelList(
//         elevation: 0,

//         expandedHeaderPadding: EdgeInsets.zero,
//         animationDuration: const Duration(milliseconds: 300),
//         expansionCallback: (panelIndex, isExpanded) {
//           setState(() {
//             _isExpanded = !_isExpanded;
//           });
//         },
//         children: [
//           ExpansionPanel(
//             backgroundColor: Colors.white,
//             isExpanded: _isExpanded,
//             canTapOnHeader: true,
//             headerBuilder: (context, isExpanded) {
//               return const ListTile(
//                 title: Text(
//                   'Tap to Expand',
//                   style: TextStyle(fontWeight: FontWeight.w600),
//                 ),
//               );
//             },
//             body: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: const [
//                     BoxShadow(color: Colors.black12, blurRadius: 6),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // HEADER ROW
//                     Row(
//                       children: const [
//                         CustomText(
//                           text: "Week 1",
//                           size: 14,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         SizedBox(width: 8),
//                         CustomText(
//                           text: "07 - 13 Jan",
//                           color: Colors.grey,
//                           size: 14,
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 16),

//                     // DAY ROW 1
//                     dayRow(
//                       day: day,
//                       weekDay: month,
//                       checkIn: time,
//                       checkOut: time,
//                       total: "7h 50m",
//                     ),

//                     const SizedBox(height: 12),

//                     // DAY ROW 2
//                     dayRow(
//                       day: day,
//                       weekDay: month,
//                       checkIn: time,
//                       //checkIn: "$time AM",
//                       checkOut: "$time PM",
//                       total: "7h 50m",
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Reusable Day Row Widget
//   Widget dayRow({
//     required String day,
//     required String weekDay,
//     required String checkIn,
//     required String checkOut,
//     required String total,
//   }) {
//     return Row(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Column(
//             children: [
//               CustomText(text: day, size: 14, fontWeight: FontWeight.w600),
//               CustomText(text: weekDay, color: Colors.grey, size: 12),
//             ],
//           ),
//         ),
//         const SizedBox(width: 12),

//         infoColumn(Icons.login, checkIn, "Check in"),
//         divider(),
//         infoColumn(Icons.logout, checkOut, "Check out"),
//         divider(),
//         infoColumn(Icons.timelapse, total, "Total Hours"),
//       ],
//     );
//   }

//   Widget infoColumn(IconData icon, String value, String label) {
//     return Expanded(
//       child: Column(
//         children: [
//           Icon(icon, size: 18, color: Colors.grey),
//           const SizedBox(height: 4),
//           CustomText(text: value, size: 13, fontWeight: FontWeight.w600),
//           CustomText(text: label, color: Colors.grey, size: 12),
//         ],
//       ),
//     );
//   }

//   Widget divider() {
//     return Container(width: 1, height: 40, color: Colors.black12);
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sib_attendance/models/attendance_model.dart';
import 'package:sib_attendance/widget/custom_text.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({
    super.key,
    required this.weekIndex,
    required this.weekStart,
    required this.weekEnd,
    required this.list,
  });

  final int weekIndex;
  final DateTime weekStart;
  final DateTime weekEnd;
  final List<AttendanceModel> list;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool _isExpanded = false;

  DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  String _weekRangeText(DateTime start, DateTime end) {
    final sameMonth = start.month == end.month && start.year == end.year;

    if (sameMonth) {
      return "${DateFormat('dd').format(start)} - ${DateFormat('dd MMM').format(end)}";
    }
    return "${DateFormat('dd MMM').format(start)} - ${DateFormat('dd MMM').format(end)}";
  }

  String _timeText(DateTime? d) {
    if (d == null) return "-";
    return DateFormat('hh:mm a').format(d);
  }

  String _totalText(Duration? d) {
    if (d == null) return "-";
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    return "${h}h ${m}m";
  }

  @override
  Widget build(BuildContext context) {
    final list = [...widget.list];
    list.sort(
      (a, b) => a.punchTime.compareTo(b.punchTime),
    ); //رتبتها من الأقدم للأحدث.

    // grouping by day
    final Map<DateTime, List<AttendanceModel>> byDay = {};
    for (final a in list) {
      final key = _dateOnly(a.punchTime);
      byDay.putIfAbsent(key, () => []).add(a);
    }

    final days = byDay.keys.toList()..sort(); //خذ كل الأيام الموجودة ونرتبها.

    return ExpansionPanelList(
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.zero,
      animationDuration: const Duration(milliseconds: 300),
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          backgroundColor: Colors.white,
          isExpanded: _isExpanded,
          canTapOnHeader: true,
          headerBuilder: (context, isExpanded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  CustomText(
                    text: "Week ${widget.weekIndex}", //يكتب: Week 1 أو Week 2…
                    size: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(width: 8),
                  CustomText(
                    text: _weekRangeText(
                      widget.weekStart,
                      widget.weekEnd,
                    ), //يكتب فترة الأسبوع زي 07 - 13 Jan
                    color: Colors.grey,
                    size: 14,
                  ),
                  const Spacer(),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                ],
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 6),
                ],
              ),
              child: Column(
                children: [
                  for (int i = 0; i < days.length; i++) ...[
                    Builder(
                      builder: (_) {
                        final date = days[i];
                        //date = اليوم الحالي
                        //items = كل الحضور الخاص بهذا اليوم
                        final items = byDay[date]!;
                        items.sort(
                          (a, b) => a.punchTime.compareTo(
                            b.punchTime,
                          ), //نرتب حضور هذا اليوم.
                        );

                        final checkIn = items.first.punchTime;
                        final checkOut = (items.length > 1)
                            ? items.last.punchTime
                            : null;

                        final total = (checkOut != null)
                            ? checkOut.difference(
                                checkIn,
                              ) //نحسب الفرق بين الخروج والدخول (المدة).
                            : null;

                        final day = DateFormat('dd').format(date);
                        final weekDay = DateFormat('EEE').format(date);

                        return dayRow(
                          day: day,
                          weekDay: weekDay,
                          checkIn: _timeText(checkIn),
                          checkOut: _timeText(checkOut),
                          total: _totalText(total),
                        );
                      },
                    ),
                    if (i != days.length - 1) const SizedBox(height: 12),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget dayRow({
    required String day,
    required String weekDay,
    required String checkIn,
    required String checkOut,
    required String total,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              CustomText(text: day, size: 14, fontWeight: FontWeight.w600),
              CustomText(text: weekDay, color: Colors.grey, size: 12),
            ],
          ),
        ),
        const SizedBox(width: 12),
        infoColumn(Icons.login, checkIn, "Check in", Colors.green),
        divider(),
        infoColumn(Icons.logout, checkOut, "Check out", Colors.red),
        divider(),
        infoColumn(Icons.timelapse, total, "Total Hours", Colors.grey),
      ],
    );
  }

  Widget infoColumn(IconData icon, String value, String label, Color color) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(height: 4),
          CustomText(text: value, size: 13, fontWeight: FontWeight.w600),
          CustomText(text: label, color: Colors.grey, size: 12),
        ],
      ),
    );
  }

  Widget divider() {
    return Container(width: 1, height: 40, color: Colors.black12);
  }
}
