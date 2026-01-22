import 'package:flutter/material.dart';
import 'package:sib_attendance/models/empolyee_models.dart';
import 'package:sib_attendance/utils/app_colors.dart';
import 'package:sib_attendance/widget/custom_text.dart';

class EmployeeProfileDialog extends StatelessWidget {
  final EmployeeModel user;

  const EmployeeProfileDialog({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
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
              height: 240,
              width: double.infinity,
              color: AppColors.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      "https://static.vecteezy.com/system/resources/previews/018/765/757/original/user-profile-icon-in-flat-style-member-avatar-illustration-on-isolated-background-human-permission-sign-business-concept-vector.jpg",
                    ),
                  ),
                  const SizedBox(height: 12),
                  // CustomText(text: "Employee ", size: 20, color: Colors.white),
                  CustomText(
                    // text: "${user.firstName} ${user.lastName}",
                    text: user.fullName,
                    size: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  CustomText(
                    text: user.department.deptName,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  CustomText(
                    text: user.position?.positionName ?? 'N/A',
                    color: Colors.white,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  // ListTile(
                  //   dense: true,
                  //   title: CustomText(text: ".age"),
                  //   trailing: CustomText(text: "age"),
                  // ),
                  // ListTile(
                  //   dense: true,
                  //   title: CustomText(text: "phone"),
                  //   trailing: CustomText(text: "user.phone."),
                  // ),
                  // ListTile(
                  //   dense: true,
                  //   title: CustomText(text: "gender"),
                  //   trailing: CustomText(text: "user."),
                  // ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("close"),
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
