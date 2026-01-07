import 'package:flutter/material.dart';
import 'package:sib_attendance/utils/app_colors.dart';
import 'package:sib_attendance/widget/custom_text.dart';
import 'package:sib_attendance/widget/mothly_attendance_item.dart';

class MonthlyAttendanceRange extends StatefulWidget {
  const MonthlyAttendanceRange({super.key});

  @override
  State<MonthlyAttendanceRange> createState() => _MonthlyAttendanceRangeState();
}

class _MonthlyAttendanceRangeState extends State<MonthlyAttendanceRange> {
  TextEditingController searchController = TextEditingController();

  // DateTime selectedDate = DateTime.now();
  // List<UserModel> usersMap = [];
  // Future<void> pickMonthYear() async {
  //   final picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2100),
  //     initialDatePickerMode: DatePickerMode.year, //يبدأ من اختيار السنة
  //   );

  //   if (picked != null) {
  //     setState(() {
  //       selectedDate = DateTime(picked.year, picked.month);
  //     });
  //   }
  // }

  DateTimeRange dateTimeRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  Future<void> pickDataRange() async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDateRange: dateTimeRange,
    );
    if (picked == null) return;
    setState(() {
      dateTimeRange = picked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final difference = dateTimeRange.duration;
    return SingleChildScrollView(
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

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: searchController.value.text.trim().isEmpty
                    ? "Employee Name"
                    : searchController.text,
                color: Colors.black,
                size: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: pickDataRange,

                    child: Text(
                      "${dateTimeRange.start.day}/${dateTimeRange.start.month}/${dateTimeRange.start.year}",
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: pickDataRange,
                    child: Text(
                      "${dateTimeRange.end.day}/${dateTimeRange.end.month}/${dateTimeRange.end.year}",
                    ),
                  ),
                ),
                Spacer(),
                CustomText(
                  text: "${difference.inDays} days",
                  color: AppColors.primary,
                  size: 16,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: MonthHeader(
          //     selectedDate: selectedDate,
          //     onPickDate: pickMonthYear,
          //     onExport: () {},
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: MonthHeader(
          //     selectedDate: selectedDate,
          //     onPickDate: pickMonthYear,
          //     onExport: () {},
          //   ),
          // ),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => MothlyAttendanceItem(),

            separatorBuilder: (context, index) => SizedBox(height: 6),
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
