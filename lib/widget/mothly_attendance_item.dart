// import 'package:flutter/material.dart';
// import 'package:sib_attendance/utils/app_colors.dart';
// import 'package:sib_attendance/widget/custom_text.dart';

// class MothlyAttendanceItem extends StatelessWidget {
//   const MothlyAttendanceItem({super.key, required});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: InkWell(
//         onTap: () {},
//         child: Card(
//           color: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CustomText(
//                           text: "17",
//                           size: 20,
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.primary,
//                         ),
//                         CustomText(
//                           text: "Nov",
//                           size: 16,
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.primary,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 Expanded(
//                   flex: 3,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CustomText(
//                         text: "ARRIVLE",
//                         size: 12,
//                         color: Colors.grey.shade600,
//                       ),
//                       CustomText(
//                         text: "DEPARTURE",
//                         size: 14,
//                         color: Colors.grey.shade600,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Column(
//                     children: [
//                       CustomText(text: "08:00 AM", size: 14),
//                       CustomText(text: "03:30 PM", size: 14),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.check_circle,
//                             color: AppColors.presentIcon,
//                           ),
//                           CustomText(
//                             text: "PRESENT",
//                             size: 14,
//                             color: AppColors.presentText,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sib_attendance/models/attendance_model.dart';
import 'package:sib_attendance/models/empolyee_models.dart';
import 'package:sib_attendance/provider/user_provider.dart';
import 'package:sib_attendance/utils/app_colors.dart';
import 'package:sib_attendance/widget/attendance_dialog.dart';
import 'package:sib_attendance/widget/custom_text.dart';
import 'package:intl/intl.dart';

class MothlyAttendanceItem extends StatelessWidget {
  final AttendanceModel attendance;
  final bool isCheckIn;

  const MothlyAttendanceItem({
    super.key,
    required this.attendance,
    this.isCheckIn = true,
  });

  @override
  Widget build(BuildContext context) {
    final date = attendance.punchTime;
    final day = DateFormat('dd').format(date);
    final month = DateFormat('MMM').format(date);
    final time = DateFormat('hh:mm a').format(date);
    final users = context.watch<UserProvider>().users;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // نجيب الموظف اللي مربوط بهالسجل
          final matchedUsers = users
              .where((u) => u.id == attendance.employeeId)
              .toList();

          if (matchedUsers.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("الموظف مش موجود في القائمة")),
            );
            return;
          }

          final employee = matchedUsers.first;

          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return AttendanceDialog(user: employee, attendance: attendance);
            },
          );
        },
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                /// Date
                Expanded(
                  child: Column(
                    children: [
                      CustomText(
                        text: day,
                        size: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                      CustomText(
                        text: month,
                        size: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),

                /// State
                Expanded(
                  flex: 3,
                  child: CustomText(
                    // text: users
                    //     .firstWhere((user) => user.id == attendance.employeeId)
                    //     .fullName,
                    text: users
                        .firstWhere((user) => attendance.employeeId == user.id)
                        .fullName,
                    size: 14,
                    color: Colors.grey.shade600,
                  ),
                ),

                /// Time
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: isCheckIn ? "Check In" : "Check Out",
                        size: 12,
                        color: isCheckIn ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 2),
                      CustomText(text: time, size: 14),
                    ],
                  ),
                ),

                /// Status
                Expanded(
                  flex: 3,
                  child:
                      // Row(
                      //   children: [
                      //     Icon(
                      //       size: 18,
                      //       attendance.terminalAlias == "Enter-Gate"
                      //           ? Icons.check_circle
                      //           : attendance.terminalAlias == "Exit-Gate"
                      //           ? Icons.check_circle
                      //           : Icons.info,
                      //       color: attendance.terminalAlias == "Enter-Gate"
                      //           ? Colors.green
                      //           : attendance.terminalAlias == "Exit-Gate"
                      //           ? AppColors.dashboardRedIcon
                      //           : Colors.grey,
                      //     ),
                      //     const SizedBox(width: 4),
                      //     CustomText(
                      //       text: attendance.state,
                      //       size: 12,
                      //       color: AppColors.presentText,
                      //     ),
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            size: 20,
                            attendance.terminalAlias == "Enter-Gate"
                                ? Icons.arrow_circle_up_rounded
                                : attendance.terminalAlias == "Exit-Gate"
                                ? Icons.arrow_circle_down
                                : Icons.info,
                            color: attendance.terminalAlias == "Enter-Gate"
                                ? Colors.green
                                : attendance.terminalAlias == "Exit-Gate"
                                ? AppColors.dashboardRedIcon
                                : Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: attendance.terminalAlias == "Enter-Gate"
                                  ? Colors.green.withOpacity(0.15)
                                  : attendance.terminalAlias == "Exit-Gate"
                                  ? Colors.red.withOpacity(0.15)
                                  : Colors.grey.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: CustomText(
                              fontWeight: FontWeight.bold,
                              text: attendance.terminalAlias == "Enter-Gate"
                                  ? "Check In"
                                  : attendance.terminalAlias == "Exit-Gate"
                                  ? "Check Out"
                                  : "",
                              size: 12,
                              color: attendance.terminalAlias == "Enter-Gate"
                                  ? Colors.green
                                  : attendance.terminalAlias == "Exit-Gate"
                                  ? AppColors.dashboardRedIcon
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
