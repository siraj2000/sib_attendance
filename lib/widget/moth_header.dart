// import 'package:flutter/material.dart';
// import 'package:sib_attendance/utils/app_colors.dart';
// import 'package:sib_attendance/utils/data_utails.dart';

// class MonthHeader extends StatelessWidget {
//   final DateTime selectedDate; //التاريخ الحالي المختار

//   final VoidCallback onPickDate; //دالة تُنفذ لما نضغط على أيقونة التقويم

//   final VoidCallback? onExport; //دالة التصدير

//   const MonthHeader({
//     super.key,
//     required this.selectedDate,
//     required this.onPickDate,
//     this.onExport,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Row(
//         children: [
//           IconButton(
//             icon: const Icon(Icons.calendar_month, color: AppColors.primary),
//             onPressed: onPickDate,
//           ),
//           Expanded(
//             child: Text(
//               "${selectedDate.day},${monthName(selectedDate.month)}, ${selectedDate.year}", //جاي من ملف utils
//               style: const TextStyle(fontWeight: FontWeight.w600),
//             ),
//           ),
//           TextButton(
//             onPressed: onExport,
//             child: Text(
//               "export",
//               style: const TextStyle(fontWeight: FontWeight.w600),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
