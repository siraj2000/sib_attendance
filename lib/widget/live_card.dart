// import 'package:flutter/material.dart';
// import 'package:sib_attendance/models/attendance_model.dart';
// import 'package:sib_attendance/models/empolyee_models.dart';
// import 'package:sib_attendance/utils/app_colors.dart';
// import 'package:sib_attendance/models/live_models.dart';
// import 'package:sib_attendance/utils/data_utails.dart';
// import 'package:sib_attendance/widget/attendance_dialog.dart';
// import 'package:sib_attendance/widget/custom_text.dart';
// import 'package:sib_attendance/widget/empolyee_profile_dialog.dart';
// import 'package:sib_attendance/widget/live_dialog.dart';

// class LiveCard extends StatelessWidget {
//   final LiveModels model;

//   const LiveCard({super.key, required this.model});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 12),
//             child: InkWell(
//               onTap: () {
//                 // showDialog(
//                 //   context: context,
//                 //   builder: (context) => EmployeeProfileDialog(user: usersMap),
//                 // );
//               },
//               child: Material(
//                 color: Colors.white,

//                 shadowColor: Colors.black.withOpacity(0.10),
//                 borderRadius: BorderRadius.circular(18),
//                 clipBehavior: Clip.antiAlias,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(18),
//                     border: Border.all(color: Colors.black12),
//                   ),
//                   child: Stack(
//                     children: [
//                       // Left color strip (nice modern touch)
//                       Positioned(
//                         left: 0,
//                         top: 0,
//                         bottom: 0,
//                         child: Container(
//                           width: 6,
//                           color: model.terminalAlias == "Enter-Gate"
//                               ? Colors.green
//                               : model.terminalAlias == "Exit-Gate"
//                               ? AppColors.dashboardRedIcon
//                               : Colors.grey,
//                         ),
//                       ),

//                       Padding(
//                         padding: const EdgeInsets.all(12),
//                         child: IntrinsicHeight(
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               // Date Box
//                               Container(
//                                 width: 55,
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 8,
//                                   horizontal: 8,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey.shade50,
//                                   borderRadius: BorderRadius.circular(14),
//                                   border: Border.all(color: Colors.black12),
//                                 ),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     CustomText(
//                                       text:
//                                           model.punchTime?.day.toString() ?? "",
//                                       size: 16,
//                                       fontWeight: FontWeight.w900,
//                                     ),
//                                     const SizedBox(height: 2),
//                                     CustomText(
//                                       text: monthName(
//                                         model.punchTime?.month ?? 0,
//                                       ),
//                                       color: Colors.grey,
//                                       size: 12,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ],
//                                 ),
//                               ),

//                               const SizedBox(width: 12),

//                               // Name + badge
//                               Expanded(
//                                 flex: 4,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,

//                                   children: [
//                                     Align(
//                                       alignment: AlignmentGeometry.centerRight,
//                                       child: CustomText(
//                                         text: model.employee?.fullName ?? "",
//                                         size: 12,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 8),

//                                     // Small info row (looks premium)
//                                   ],
//                                 ),
//                               ),

//                               const SizedBox(width: 10),
//                               const VerticalDivider(
//                                 thickness: 1,
//                                 width: 18,
//                                 color: Colors.black12,
//                               ),

//                               // Time (cleaner)
//                               Expanded(
//                                 flex: 3,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.all(9),
//                                       decoration: BoxDecoration(
//                                         color: Colors.grey.shade100,
//                                         shape: BoxShape.circle,
//                                         border: Border.all(
//                                           color: Colors.black12,
//                                         ),
//                                       ),
//                                       child: const Icon(
//                                         Icons.access_time,
//                                         size: 16,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 8),
//                                     CustomText(
//                                       text:
//                                           "${model.punchTime?.hour.toString().padLeft(2, '0')}:${model.punchTime?.minute.toString().padLeft(2, '0')}",
//                                       size: 13,
//                                       fontWeight: FontWeight.w900,
//                                     ),
//                                   ],
//                                 ),
//                               ),

//                               const VerticalDivider(
//                                 thickness: 1,
//                                 width: 18,
//                                 color: Colors.black12,
//                               ),

//                               // Status chip (more premium)
//                               Expanded(
//                                 flex: 4,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.all(9),
//                                       decoration: BoxDecoration(
//                                         color:
//                                             model.terminalAlias == "Enter-Gate"
//                                             ? Colors.green.withOpacity(0.12)
//                                             : model.terminalAlias == "Exit-Gate"
//                                             ? AppColors.dashboardRedIcon
//                                                   .withOpacity(0.12)
//                                             : Colors.grey.withOpacity(0.12),
//                                         shape: BoxShape.circle,
//                                         border: Border.all(
//                                           color: Colors.black12,
//                                         ),
//                                       ),
//                                       child: Icon(
//                                         model.terminalAlias == "Enter-Gate"
//                                             ? Icons.login
//                                             : model.terminalAlias == "Exit-Gate"
//                                             ? Icons.logout
//                                             : Icons.info,
//                                         size: 18,
//                                         color:
//                                             model.terminalAlias == "Enter-Gate"
//                                             ? Colors.green
//                                             : model.terminalAlias == "Exit-Gate"
//                                             ? AppColors.dashboardRedIcon
//                                             : Colors.grey,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 8),
//                                     Container(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 10,
//                                         vertical: 4,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color:
//                                             model.terminalAlias == "Enter-Gate"
//                                             ? Colors.green.withOpacity(0.12)
//                                             : model.terminalAlias == "Exit-Gate"
//                                             ? AppColors.dashboardRedIcon
//                                                   .withOpacity(0.12)
//                                             : Colors.grey.withOpacity(0.10),
//                                         borderRadius: BorderRadius.circular(24),
//                                         border: Border.all(
//                                           color:
//                                               model.terminalAlias ==
//                                                   "Enter-Gate"
//                                               ? Colors.green.withOpacity(0.25)
//                                               : model.terminalAlias ==
//                                                     "Exit-Gate"
//                                               ? AppColors.dashboardRedIcon
//                                                     .withOpacity(0.25)
//                                               : Colors.black12,
//                                         ),
//                                       ),
//                                       child: CustomText(
//                                         fontWeight: FontWeight.w900,
//                                         text:
//                                             model.terminalAlias == "Enter-Gate"
//                                             ? "Check In"
//                                             : model.terminalAlias == "Exit-Gate"
//                                             ? "Check Out"
//                                             : "Info",
//                                         size: 11,
//                                         color:
//                                             model.terminalAlias == "Enter-Gate"
//                                             ? Colors.green
//                                             : model.terminalAlias == "Exit-Gate"
//                                             ? AppColors.dashboardRedIcon
//                                             : Colors.grey,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sib_attendance/models/live_models.dart';
import 'package:sib_attendance/utils/app_colors.dart';
import 'package:sib_attendance/utils/data_utails.dart';
import 'package:sib_attendance/widget/custom_text.dart';
import 'package:sib_attendance/widget/empolyee_profile_dialog.dart';
import 'package:sib_attendance/widget/live_dialog.dart';

class LiveCard extends StatelessWidget {
  final LiveModels model;

  const LiveCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Material(
              color: Colors.white,
              shadowColor: Colors.black.withOpacity(0.10),
              borderRadius: BorderRadius.circular(18),
              clipBehavior: Clip.antiAlias,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.black12),
                ),
                child: Stack(
                  children: [
                    // Left color strip
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        width: 6,
                        color: model.terminalAlias == "Enter-Gate"
                            ? Colors.green
                            : model.terminalAlias == "Exit-Gate"
                            ? AppColors.dashboardRedIcon
                            : Colors.grey,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Date Box
                            Container(
                              width: 55,
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: Colors.black12),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomText(
                                    text: model.punchTime?.day.toString() ?? "",
                                    size: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  const SizedBox(height: 2),
                                  CustomText(
                                    text: monthName(
                                      model.punchTime?.month ?? 0,
                                    ),
                                    color: Colors.grey,
                                    size: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 12),

                            // Employee Name
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: CustomText(
                                      text: model.employee?.fullName ?? "",
                                      size: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ),

                            const SizedBox(width: 10),
                            const VerticalDivider(
                              thickness: 1,
                              width: 18,
                              color: Colors.black12,
                            ),

                            // Time
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(9),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black12),
                                    ),
                                    child: const Icon(
                                      Icons.access_time,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  CustomText(
                                    text:
                                        "${model.punchTime?.hour.toString().padLeft(2, '0')}:${model.punchTime?.minute.toString().padLeft(2, '0')}",
                                    size: 13,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ],
                              ),
                            ),

                            const VerticalDivider(
                              thickness: 1,
                              width: 18,
                              color: Colors.black12,
                            ),

                            // Status
                            Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(9),
                                    decoration: BoxDecoration(
                                      color: model.terminalAlias == "Enter-Gate"
                                          ? Colors.green.withOpacity(0.12)
                                          : model.terminalAlias == "Exit-Gate"
                                          ? AppColors.dashboardRedIcon
                                                .withOpacity(0.12)
                                          : Colors.grey.withOpacity(0.12),
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black12),
                                    ),
                                    child: Icon(
                                      model.terminalAlias == "Enter-Gate"
                                          ? Icons.login
                                          : model.terminalAlias == "Exit-Gate"
                                          ? Icons.logout
                                          : Icons.info,
                                      size: 18,
                                      color: model.terminalAlias == "Enter-Gate"
                                          ? Colors.green
                                          : model.terminalAlias == "Exit-Gate"
                                          ? AppColors.dashboardRedIcon
                                          : Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: model.terminalAlias == "Enter-Gate"
                                          ? Colors.green.withOpacity(0.12)
                                          : model.terminalAlias == "Exit-Gate"
                                          ? AppColors.dashboardRedIcon
                                                .withOpacity(0.12)
                                          : Colors.grey.withOpacity(0.10),
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(
                                        color:
                                            model.terminalAlias == "Enter-Gate"
                                            ? Colors.green.withOpacity(0.25)
                                            : model.terminalAlias == "Exit-Gate"
                                            ? AppColors.dashboardRedIcon
                                                  .withOpacity(0.25)
                                            : Colors.black12,
                                      ),
                                    ),
                                    child: CustomText(
                                      fontWeight: FontWeight.w900,
                                      text: model.terminalAlias == "Enter-Gate"
                                          ? "Check In"
                                          : model.terminalAlias == "Exit-Gate"
                                          ? "Check Out"
                                          : "Info",
                                      size: 11,
                                      color: model.terminalAlias == "Enter-Gate"
                                          ? Colors.green
                                          : model.terminalAlias == "Exit-Gate"
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
