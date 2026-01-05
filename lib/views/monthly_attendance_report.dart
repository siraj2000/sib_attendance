import 'package:flutter/material.dart';
import 'package:sib_attendance/models/user_models.dart';

import 'package:sib_attendance/widget/custom_text.dart';
import 'package:sib_attendance/widget/moth_header.dart';
import 'package:sib_attendance/widget/mothly_attendance_item.dart';

class MonthlyAttendanceReport extends StatefulWidget {
  const MonthlyAttendanceReport({super.key});

  @override
  State<MonthlyAttendanceReport> createState() =>
      _MonthlyAttendanceReportState();
}

class _MonthlyAttendanceReportState extends State<MonthlyAttendanceReport> {
  TextEditingController searchController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  List<UserModel> usersMap = [];
  Future<void> pickMonthYear() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDatePickerMode: DatePickerMode.year, //يبدأ من اختيار السنة
    );

    if (picked != null) {
      setState(() {
        selectedDate = DateTime(picked.year, picked.month);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Monthly Attendance Report", size: 14),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Text(
              searchController.value.text.trim().isEmpty
                  ? "name"
                  : searchController.text,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MonthHeader(
                selectedDate: selectedDate,
                onPickDate: pickMonthYear,
                onExport: () {},
              ),
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => MothlyAttendanceItem(),

              separatorBuilder: (context, index) => SizedBox(height: 6),
              itemCount: 10,
            ),
          ],
        ),
      ),
    );
  }
}
