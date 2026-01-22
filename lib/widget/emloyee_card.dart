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
          elevation: 3,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: ListTile(
            leading: Icon(Icons.arrow_back_ios, color: Colors.grey),
            title: Align(
              alignment: AlignmentGeometry.centerRight,
              child: CustomText(text: usersMap.fullName),
            ),

            subtitle: Align(
              alignment: AlignmentGeometry.centerRight,
              child: CustomText(
                //text: usersMap.email,
                text: usersMap.department.deptName,
                size: 13,
                color: const Color.fromARGB(255, 92, 88, 88),
              ),
            ),
            trailing: Column(
              children: [
                Icon(Icons.person, color: Colors.grey),
                CustomText(text: usersMap.empCode),
              ],
            ),
            // CustomText(text: usersMap.age.toString()),
          ),
        ),
      ),
    );
  }
}
