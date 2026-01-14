// import 'package:flutter/material.dart';
// import 'package:sib_attendance/models/attendance_model.dart';
// import 'package:sib_attendance/models/empolyee_models.dart';
// import 'package:sib_attendance/models/user_models.dart';
// import 'package:sib_attendance/utils/app_colors.dart';
// import 'package:sib_attendance/widget/custom_text.dart';

// class AttendanceDialog extends StatelessWidget {
//   final AttendanceModel  user;

//   const AttendanceDialog({super.key, required this.user});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.white,
//       insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               height: 240,
//               width: double.infinity,
//               color: AppColors.primary,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: 34,
//                     backgroundColor: Colors.white,
//                     backgroundImage: NetworkImage(
//                       "https://static.vecteezy.com/system/resources/previews/018/765/757/original/user-profile-icon-in-flat-style-member-avatar-illustration-on-isolated-background-human-permission-sign-business-concept-vector.jpg",
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   // CustomText(text: "Employee ", size: 20, color: Colors.white),
//                   CustomText(
//                     // text: "${user.firstName} ${user.lastName}",
//                     text: user.employeeCode,
//                     size: 20,
//                     color: Colors.white,
//                   ),
//                   const SizedBox(height: 8),
//                   CustomText(
//                     text: user.firstName.toString(),
//                     color: Colors.white,
//                   ),
//                   const SizedBox(height: 8),
//                   CustomText(
//                     text:
//                         user.firstName?.toString() ??
//                         " لا يوجد موظف بهذا المنصب ",
//                     color: Colors.white,
//                   ),
//                 ],
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.all(12),
//               child: Column(
//                 children: [
//                   ListTile(
//                     dense: true,
//                     title: CustomText(text: ".age"),
//                     trailing: CustomText(text: "age"),
//                   ),
//                   ListTile(
//                     dense: true,
//                     title: CustomText(text: "phone"),
//                     trailing: CustomText(text: "user.phone."),
//                   ),
//                   ListTile(
//                     dense: true,
//                     title: CustomText(text: "gender"),
//                     trailing: CustomText(text: "user."),
//                   ),
//                   const SizedBox(height: 8),
//                   SizedBox(
//                     width: double.infinity,
//                     child: OutlinedButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: Text("close"),
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

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:sib_attendance/models/attendance_model.dart';
import 'package:sib_attendance/models/empolyee_models.dart';
import 'package:sib_attendance/models/user_models.dart'; // <-- حسب موديلك الحقيقي
import 'package:sib_attendance/utils/app_colors.dart';
import 'package:sib_attendance/widget/custom_text.dart';

class AttendanceDialog extends StatelessWidget {
  final EmployeeModel user; // <-- موديل الموظف
  final AttendanceModel attendance; // <-- موديل الحضور

  const AttendanceDialog({
    super.key,
    required this.user,
    required this.attendance,
  });

  @override
  Widget build(BuildContext context) {
    final dateText = DateFormat('yyyy-MM-dd').format(attendance.punchTime);
    final timeText = DateFormat('hh:mm a').format(attendance.punchTime);

    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 230,
              width: double.infinity,
              color: AppColors.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      "https://static.vecteezy.com/system/resources/previews/018/765/757/original/user-profile-icon-in-flat-style-member-avatar-illustration-on-isolated-background-human-permission-sign-business-concept-vector.jpg",
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomText(
                    text: user.fullName ?? "-",
                    size: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 6),
                  CustomText(
                    text: user.position!.positionName ?? "",
                    color: Colors.white,
                  ),
                  const SizedBox(height: 6),
                  // CustomText(
                  //   text: punchType,
                  //   color: isCheckIn ? Colors.greenAccent : Colors.redAccent,
                  //   fontWeight: FontWeight.bold,
                  // ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    title: const CustomText(text: "Date"),
                    trailing: CustomText(text: dateText),
                  ),
                  ListTile(
                    dense: true,
                    title: const CustomText(text: "Time"),
                    trailing: CustomText(text: timeText),
                  ),
                  ListTile(
                    dense: true,
                    title: const CustomText(text: "Terminal"),
                    trailing: CustomText(text: attendance.terminalAlias ?? "-"),
                  ),
                  ListTile(
                    dense: true,
                    title: const CustomText(text: "State"),
                    trailing: CustomText(text: attendance.state ?? "-"),
                  ),

                  const Divider(),

                  ListTile(
                    dense: true,
                    title: const CustomText(text: "Phone"),
                    trailing: CustomText(text: user.department.deptName ?? "-"),
                  ),
                  ListTile(
                    dense: true,
                    title: const CustomText(text: "Gender"),
                    trailing: CustomText(text: user.empCode ?? "-"),
                  ),

                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Close"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
