import 'package:flutter/material.dart';

import 'package:sib_attendance/utils/app_colors.dart';
import 'package:sib_attendance/widget/custom_text.dart';
import 'package:sib_attendance/widget/mothly_attendance_item.dart';

class MonthlyAttendanceReport extends StatefulWidget {
  const MonthlyAttendanceReport({super.key});

  @override
  State<MonthlyAttendanceReport> createState() =>
      _MonthlyAttendanceReportState();
}

class _MonthlyAttendanceReportState extends State<MonthlyAttendanceReport> {
  TextEditingController searchController = TextEditingController();

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
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Monthly Attendance Report", size: 14),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),

                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  hintText: "Department",
                ),
                onChanged: (value) => setState(() {}),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: searchController.value.text.trim().isEmpty
                      ? "Employee Name"
                      : searchController.value.text,
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

  //تلقاها للزمان
            // Row(
            //   children: [
            //     Expanded(
            //       flex: 2,
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(
            //           horizontal: 8,
            //           vertical: 10,
            //         ),
            //         child: DropdownButtonFormField<String>(
            //           dropdownColor: Colors.white,
            //           decoration: InputDecoration(
            //             contentPadding: const EdgeInsets.symmetric(
            //               horizontal: 10,
            //               vertical: 15,
            //             ),
            //             focusColor: Colors.white,
            //             border: OutlineInputBorder(
            //               borderSide: const BorderSide(color: Colors.white),
            //               borderRadius: BorderRadius.circular(15),
            //             ),
            //           ),
            //           hint: const Text("select office"),
            //           items: const [
            //             DropdownMenuItem(child: Text('الكل'), value: "الكل"),
            //             DropdownMenuItem(
            //               child: Text('بنغازي'),
            //               value: "بنغازي",
            //             ),
            //             DropdownMenuItem(
            //               child: Text('طرابلس'),
            //               value: "طرابلس",
            //             ),
            //             DropdownMenuItem(child: Text('المرج'), value: "المرج"),
            //             DropdownMenuItem(child: Text('الخمس'), value: "الخمس"),
            //           ],
            //           onChanged: (String? value) {},
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       flex: 3,
            //       child: Padding(
            //         padding: const EdgeInsets.all(10.0),
            //         child: TextFormField(
            //           controller: searchController,
            //           onChanged: (value) => setState(() {}),
            //           decoration: InputDecoration(
            //             contentPadding: const EdgeInsets.symmetric(
            //               horizontal: 10,
            //               vertical: 15,
            //             ),
            //             hintText: "Search",
            //             prefixIcon: const Icon(Icons.search),
            //             border: OutlineInputBorder(
            //               borderSide: BorderSide(color: Colors.grey),
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sib_attendance/provider/departments_provider.dart';
// import 'package:sib_attendance/utils/app_colors.dart';
// import 'package:sib_attendance/widget/custom_text.dart';
// import 'package:sib_attendance/widget/mothly_attendance_item.dart';

// class MonthlyAttendanceReport extends StatefulWidget {
//   const MonthlyAttendanceReport({super.key});

//   @override
//   State<MonthlyAttendanceReport> createState() =>
//       _MonthlyAttendanceReportState();
// }

// class _MonthlyAttendanceReportState extends State<MonthlyAttendanceReport> {
//   TextEditingController searchController = TextEditingController();
//   TextEditingController deptController = TextEditingController();

//   String? selectedDeptValue = "all"; // نخزن dept_code أو "all"

//   DateTimeRange dateTimeRange = DateTimeRange(
//     start: DateTime.now(),
//     end: DateTime.now(),
//   );

//   Future<void> pickDataRange() async {
//     DateTimeRange? picked = await showDateRangePicker(
//       context: context,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//       initialDateRange: dateTimeRange,
//     );
//     if (picked == null) return;
//     setState(() => dateTimeRange = picked);
//   }

//   @override
//   void initState() {
//     super.initState();
//     // تحميل الأقسام مرة واحدة عند فتح الشاشة
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<DepartmentsProvider>().fetchDepartments();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final difference = dateTimeRange.duration;

//     return Scaffold(
//       appBar: AppBar(
//         title: CustomText(text: "Monthly Attendance Report", size: 14),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 8,
//                       vertical: 10,
//                     ),
//                     child: Consumer<DepartmentsProvider>(
//                       builder: (context, depProv, _) {
//                         return DropdownButtonFormField<String>(
//                           isExpanded: true,
//                           menuMaxHeight: 300,
//                           dropdownColor: Colors.white,
//                           decoration: InputDecoration(
//                             contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 10,
//                               vertical: 15,
//                             ),
//                             focusColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.white),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                           hint: Text(
//                             depProv.isLoading
//                                 ? "جاري تحميل الأقسام..."
//                                 : (depProv.error.isNotEmpty
//                                       ? "حدث خطأ"
//                                       : "select office"),
//                           ),
//                           value: selectedDeptValue,
//                           items: [
//                             const DropdownMenuItem(
//                               value: "all",
//                               child: Text('الكل'),
//                             ),
//                             ...depProv.departments.map((d) {
//                               return DropdownMenuItem(
//                                 value: d.deptName, // أو d.id.toString()
//                                 child: Text(d.deptName),
//                               );
//                             }).toList(),
//                           ],
//                           onChanged: depProv.isLoading
//                               ? null
//                               : (String? value) {
//                                   setState(() => selectedDeptValue = value);

//                                   // هنا تقدر تستخدمها للفلترة
//                                   // لو value == "all" => الكل
//                                   // غيرها => deptCode للقسم المختار
//                                 },
//                         );
//                       },
//                     ),
//                   ),
//                 ),

//                 Expanded(
//                   flex: 3,
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: TextFormField(
//                       controller: searchController,
//                       onChanged: (value) => setState(() {}),
//                       decoration: InputDecoration(
//                         contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 15,
//                         ),
//                         hintText: "Search",
//                         prefixIcon: const Icon(Icons.search),
//                         border: OutlineInputBorder(
//                           borderSide: const BorderSide(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Row(
//                   children: [
//                     CustomText(
//                       text:
//                           (selectedDeptValue == null ||
//                               selectedDeptValue == "all")
//                           ? "Department"
//                           : selectedDeptValue!, // ✅ يعرض اسم القسم المختار
//                       color: Colors.black,
//                       size: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     Spacer(),
//                     CustomText(
//                       text: searchController.value.text.trim().isEmpty
//                           ? "Employee Name"
//                           : searchController.value.text,
//                       color: Colors.black,
//                       size: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 10),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 3,
//                     child: ElevatedButton(
//                       onPressed: pickDataRange,
//                       child: Text(
//                         "${dateTimeRange.start.day}/${dateTimeRange.start.month}/${dateTimeRange.start.year}",
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     flex: 3,
//                     child: ElevatedButton(
//                       onPressed: pickDataRange,
//                       child: Text(
//                         "${dateTimeRange.end.day}/${dateTimeRange.end.month}/${dateTimeRange.end.year}",
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   CustomText(
//                     text: "${difference.inDays} days",
//                     color: AppColors.primary,
//                     size: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ],
//               ),
//             ),

//             ListView.separated(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemBuilder: (context, index) => const MothlyAttendanceItem(),
//               separatorBuilder: (context, index) => const SizedBox(height: 6),
//               itemCount: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
