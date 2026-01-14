// import 'package:flutter/material.dart';
// import 'package:sib_attendance/utils/app_colors.dart';
// import 'package:sib_attendance/models/live_models.dart';
// import 'package:sib_attendance/utils/data_utails.dart';
// import 'package:sib_attendance/widget/custom_text.dart';

// class LiveCard extends StatelessWidget {
//   final LiveModels model;

//   const LiveCard({super.key, required this.model});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CustomText(
//                         text: model.punchTime?.day.toString() ?? "",
//                         size: 20,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.primary,
//                       ),
//                       CustomText(
//                         text: monthName(model.punchTime?.month ?? 0),
//                         size: 16,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.primary,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               Expanded(
//                 flex: 2,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.end,

//                   children: [
//                     CustomText(
//                       text: model.employee?.fullName ?? "",
//                       size: 16,
//                       color: Colors.grey.shade600,
//                     ),
//                     CustomText(
//                       text: model.employee?.department.deptName ?? "",
//                       size: 14,
//                       color: Colors.grey.shade600,
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Column(
//                   children: [
//                     CustomText(
//                       text:
//                           "${model.punchTime?.hour.toString().padLeft(2, '0')}:${model.punchTime?.minute.toString().padLeft(2, '0')}:${model.punchTime?.second.toString().padLeft(2, '0')}",
//                       size: 13,
//                     ),
//                     // CustomText(text: "03:30 PM", size: 14),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         // Icon(Icons.check_circle, color: AppColors.presentIcon),
//                         // CustomText(
//                         //   text: "state",
//                         //   size: 14,
//                         //   color: AppColors.presentText,
//                         // ),
//                         Icon(
//                           size: 20,
//                           model.terminalAlias == "Enter-Gate"
//                               ? Icons.check_circle
//                               : model.terminalAlias == "Exit-Gate"
//                               ? Icons.check_circle
//                               : Icons.info,
//                           color: model.terminalAlias == "Enter-Gate"
//                               ? Colors.green
//                               : model.terminalAlias == "Exit-Gate"
//                               ? AppColors.dashboardRedIcon
//                               : Colors.grey,
//                         ),
//                         SizedBox(width: 2),
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 6,
//                             vertical: 4,
//                           ),
//                           decoration: BoxDecoration(
//                             color: model.terminalAlias == "Enter-Gate"
//                                 ? Colors.green.withOpacity(0.15)
//                                 : model.terminalAlias == "Exit-Gate"
//                                 ? Colors.red.withOpacity(0.15)
//                                 : Colors.grey.withOpacity(0.15),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Align(
//                             child: CustomText(
//                               fontWeight: FontWeight.bold,
//                               text: model.terminalAlias == "Enter-Gate"
//                                   ? "Check In"
//                                   : model.terminalAlias == "Exit-Gate"
//                                   ? "Check Out"
//                                   : "",
//                               size: 12,
//                               color: model.terminalAlias == "Enter-Gate"
//                                   ? Colors.green
//                                   : model.terminalAlias == "Exit-Gate"
//                                   ? AppColors.dashboardRedIcon
//                                   : Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:sib_attendance/models/live_models.dart';
// // import 'package:sib_attendance/widget/custom_text.dart';

// // class LiveCard extends StatelessWidget {
// //   final LiveModels model;

// //   const LiveCard({super.key, required this.model});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(8.0),
// //       child: Card(
// //         child: Padding(
// //           padding: const EdgeInsets.all(10.0),
// //           child: Row(
// //             children: [
// //               /// 📅 Date
// //               Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     CustomText(
// //                       text: model.punchTime?.day.toString() ?? "--",
// //                       size: 20,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                     CustomText(
// //                       text: model.punchTime != null
// //                           ? _monthName(model.punchTime!.month)
// //                           : "--",
// //                       size: 14,
// //                     ),
// //                   ],
// //                 ),
// //               ),

// //               /// 👤 Name
// //               Expanded(
// //                 flex: 3,
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     CustomText(
// //                       text: model.employee?.fullName ?? "Unknown",
// //                       size: 14,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                     CustomText(
// //                       text: model.employee?.department.deptName ?? "",

// //                       size: 12,
// //                       color: Colors.grey,
// //                     ),
// //                   ],
// //                 ),
// //               ),

// //               /// ⏰ Time
// //               Expanded(
// //                 flex: 2,
// //                 child: CustomText(
// //                   text: model.punchTime != null
// //                       ? "${model.punchTime!.hour}:${model.punchTime!.minute.toString().padLeft(2, '0')}"
// //                       : "--:--",
// //                 ),
// //               ),

// //               /// ✅ State
// //               Expanded(
// //                 flex: 2,
// //                 child: Row(
// //                   children: [
// //                     Icon(
// //                       Icons.check_circle,
// //                       color: model.state == "present"
// //                           ? Colors.green
// //                           : Colors.red,
// //                     ),
// //                     SizedBox(width: 4),
// //                     CustomText(
// //                       text: model.state?.toUpperCase() ?? "UNKNOWN",
// //                       size: 12,
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   String _monthName(int month) {
// //     const months = [
// //       "Jan",
// //       "Feb",
// //       "Mar",
// //       "Apr",
// //       "May",
// //       "Jun",
// //       "Jul",
// //       "Aug",
// //       "Sep",
// //       "Oct",
// //       "Nov",
// //       "Dec",
// //     ];
// //     return months[month - 1];
// //   }
// // }
import 'package:flutter/material.dart';
import 'package:sib_attendance/utils/app_colors.dart';
import 'package:sib_attendance/models/live_models.dart';
import 'package:sib_attendance/utils/data_utails.dart';
import 'package:sib_attendance/widget/custom_text.dart';

class LiveCard extends StatelessWidget {
  final LiveModels model;

  const LiveCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              /// 📅 Day + Month
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: model.punchTime?.day.toString() ?? "",
                        size: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                      CustomText(
                        text: monthName(model.punchTime?.month ?? 0),
                        size: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: model.employee?.fullName ?? "",
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              CustomText(
                text: model.employee?.department.deptName ?? "",
                size: 14,
                color: Colors.grey.shade600,
              ),
              // ⏰ Time
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text:
                          "${model.punchTime?.hour.toString().padLeft(2, '0')}:${model.punchTime?.minute.toString().padLeft(2, '0')}:${model.punchTime?.second.toString().padLeft(2, '0')}",
                      size: 13,
                    ),
                  ],
                ),
              ),

              /// ✅ Check In / Check Out
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          size: 18,
                          model.terminalAlias == "Enter-Gate"
                              ? Icons.check_circle
                              : model.terminalAlias == "Exit-Gate"
                              ? Icons.check_circle
                              : Icons.info,
                          color: model.terminalAlias == "Enter-Gate"
                              ? Colors.green
                              : model.terminalAlias == "Exit-Gate"
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
                            color: model.terminalAlias == "Enter-Gate"
                                ? Colors.green.withOpacity(0.15)
                                : model.terminalAlias == "Exit-Gate"
                                ? Colors.red.withOpacity(0.15)
                                : Colors.grey.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CustomText(
                            fontWeight: FontWeight.bold,
                            text: model.terminalAlias == "Enter-Gate"
                                ? "Check In"
                                : model.terminalAlias == "Exit-Gate"
                                ? "Check Out"
                                : "",
                            size: 12,
                            color: model.terminalAlias == "Enter-Gate"
                                ? Colors.green
                                : model.terminalAlias == "Exit-Gate"
                                ? AppColors.dashboardRedIcon
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
