import 'package:flutter/material.dart';
import 'package:sib_attendance/models/user_models.dart';
import 'package:sib_attendance/utils/app_colors.dart';

import 'package:sib_attendance/widget/custom_text.dart';
import 'package:sib_attendance/widget/empolyee_profile_dialog.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, required this.usersMap});

  final UserModel usersMap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => EmployeeProfileDialog(user: usersMap),
          );
        },
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.primary,
              radius: 17,
              child: CustomText(text: "1"),
              //Text("usersMap.id.toString()"),
            ),
            title: CustomText(
              //text: "Employee Name ",
              text: "${usersMap.firstName} ${usersMap.lastName}",
            ),

            subtitle: CustomText(
              //text: usersMap.email,
              text: "Employee email ",
              size: 13,
              color: Colors.grey[500],
            ),
            trailing: CustomText(text: usersMap.age.toString()),
          ),
        ),
      ),
    );
  }
}
