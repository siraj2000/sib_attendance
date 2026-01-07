import 'package:flutter/material.dart';

import 'package:sib_attendance/utils/app_colors.dart';

import 'package:sib_attendance/widget/custom_text.dart';
import 'package:sib_attendance/widget/dialog_itmes.dart';
import 'package:sib_attendance/widget/synchronaization_items.dart';

class SynchronizationViews extends StatefulWidget {
  const SynchronizationViews({super.key});

  @override
  State<SynchronizationViews> createState() => _SynchronizationViewsState();
}

class _SynchronizationViewsState extends State<SynchronizationViews> {
  final _startController = TextEditingController();
  final _endController = TextEditingController();
  DateTime time = DateTime.now();
  DateTime time1 = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: CustomText(text: "Synchronization")),
      body: Column(
        children: [
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SynchronaizationItems(
                title: "Sync Employees",
                lastSync: "2025-12-31 17:06:47",

                onTap: () {},
                bgColor: AppColors.primary,
                icon: Icons.people,
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 5),
            itemCount: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFE7FF),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.access_time_rounded,
                          color: Color(0xFF7A4DFF),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Sync Logs',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF111827),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),

                  const Text(
                    'Start Date',
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Color(0xFF6B7280),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _startController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "${time.month}/${time.day}/${time.year}",
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: Color(0xFFE3E6EF)),
                      ),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: Icon(Icons.calendar_month_outlined, size: 20),
                      ),
                      // suffixIconConstraints: const BoxConstraints(
                      //   minWidth: 44,
                      //   minHeight: 44,
                      // ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onTap: () async {
                      time =
                          await showDatePicker(
                            context: context,
                            initialDate: time,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                          ) ??
                          DateTime.now();
                      // if (picked == null) return;
                      // setState(() {
                      //   time = picked;
                      // });
                      setState(() {});
                    },
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    'End Date',
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Color(0xFF6B7280),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _endController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "${time1.month}/${time1.day}/${time1.year}",
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: Color(0xFFE3E6EF)),
                      ),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: Icon(Icons.calendar_month_outlined, size: 20),
                      ),
                      // suffixIconConstraints: const BoxConstraints(
                      //   minWidth: 44,
                      //   minHeight: 44,
                      // ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onTap: () async {
                      final picked1 = await showDatePicker(
                        context: context,
                        initialDate: time1,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(3000),
                      );
                      if (picked1 == null) return;
                      setState(() {
                        time1 = picked1;
                      });
                    },
                    // onTap: () => _pickDate(isStart: false),
                    // decoration: _decoration(),
                  ),

                  const SizedBox(height: 18),

                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => DialogItmes(),
                        );
                        // // TODO: call your sync method (dio) using _startDate / _endDate
                        // debugPrint('Sync: start=$_startDate, end=$_endDate');
                      },
                      icon: const Icon(Icons.sync_rounded, size: 20),
                      label: const Text(
                        'Sync Now',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class SyncLogsCard extends StatefulWidget {
//   const SyncLogsCard({super.key});

//   @override
//   State<SyncLogsCard> createState() => _SyncLogsCardState();
// }

// class _SyncLogsCardState extends State<SyncLogsCard> {
//   final _startController = TextEditingController();
//   final _endController = TextEditingController();

//   DateTime? _startDate;
//   DateTime? _endDate;

//   final _fmt = DateFormat('MM/dd/yyyy');

//   Future<void> _pickDate({required bool isStart}) async {
//     final initial = (isStart ? _startDate : _endDate) ?? DateTime.now();

//     final picked = await showDatePicker(
//       context: context,
//       initialDate: initial,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );

//     if (picked == null) return;

//     setState(() {
//       if (isStart) {
//         _startDate = picked;
//         _startController.text = _fmt.format(picked);

//         // if end date is before start date, clear end
//         if (_endDate != null && _endDate!.isBefore(picked)) {
//           _endDate = null;
//           _endController.clear();
//         }
//       } else {
//         _endDate = picked;
//         _endController.text = _fmt.format(picked);
//       }
//     });
//   }

//   InputDecoration _decoration() {
//     return InputDecoration(
//       hintText: 'mm/dd/yyyy',
//       isDense: true,
//       contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(14),
//         borderSide: const BorderSide(color: Color(0xFFE3E6EF)),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(14),
//         borderSide: const BorderSide(color: Color(0xFFE3E6EF)),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(14),
//         borderSide: const BorderSide(color: Color(0xFFB58CFF), width: 1.4),
//       ),
//       suffixIcon: const Padding(
//         padding: EdgeInsets.only(right: 6),
//         child: Icon(Icons.calendar_month_outlined, size: 20),
//       ),
//       suffixIconConstraints: const BoxConstraints(minWidth: 44, minHeight: 44),
//       filled: true,
//       fillColor: Colors.white,
//     );
//   }

//   @override
//   void dispose() {
//     _startController.dispose();
//     _endController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: Colors.grey.shade300),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.06),
//               blurRadius: 18,
//               offset: const Offset(0, 8),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   width: 44,
//                   height: 44,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFEFE7FF),
//                     borderRadius: BorderRadius.circular(14),
//                   ),
//                   child: const Icon(
//                     Icons.access_time_rounded,
//                     color: Color(0xFF7A4DFF),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 const Text(
//                   'Sync Logs',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w700,
//                     color: Color(0xFF111827),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 18),

//             const Text(
//               'Start Date',
//               style: TextStyle(
//                 fontSize: 12.5,
//                 color: Color(0xFF6B7280),
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextFormField(
//               controller: _startController,
//               readOnly: true,
//               onTap: () => _pickDate(isStart: true),
//               decoration: _decoration(),
//             ),

//             const SizedBox(height: 14),

//             const Text(
//               'End Date',
//               style: TextStyle(
//                 fontSize: 12.5,
//                 color: Color(0xFF6B7280),
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextFormField(
//               controller: _endController,
//               readOnly: true,
//               onTap: () => _pickDate(isStart: false),
//               decoration: _decoration(),
//             ),

//             const SizedBox(height: 18),

//             SizedBox(
//               width: double.infinity,
//               height: 52,
//               child: ElevatedButton.icon(
//                 onPressed: () {
//                   // // TODO: call your sync method (dio) using _startDate / _endDate
//                   // debugPrint('Sync: start=$_startDate, end=$_endDate');
//                 },
//                 icon: const Icon(Icons.sync_rounded, size: 20),
//                 label: const Text(
//                   'Sync Now',
//                   style: TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFFB58CFF),
//                   foregroundColor: Colors.white,
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(14),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
