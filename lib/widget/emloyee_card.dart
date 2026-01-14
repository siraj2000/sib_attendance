import 'package:flutter/material.dart';
import 'package:sib_attendance/models/empolyee_models.dart';
import 'package:sib_attendance/widget/custom_text.dart';
import 'package:sib_attendance/widget/empolyee_profile_dialog.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, required this.usersMap});

  final EmployeeModel usersMap;

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
            leading: Container(
              width: 35,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFEFE7FF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: CustomText(text: usersMap.id.toString()),
            ),
            title: CustomText(text: usersMap.fullName),

            subtitle: CustomText(
              //text: usersMap.email,
              text: usersMap.department.deptName,
              size: 13,
              color: const Color.fromARGB(255, 92, 88, 88),
            ),
            trailing: CustomText(text: usersMap.empCode),
            // CustomText(text: usersMap.age.toString()),
          ),
        ),
      ),
    );
  }
}
