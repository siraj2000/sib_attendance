// import 'package:flutter/material.dart';
// import 'package:sib_attendance/models/attendance_model.dart';
// import 'package:sib_attendance/network/api.dart';
// import 'package:sib_attendance/service/attendance_service.dart';

// class AttendanceProvider extends ChangeNotifier {
//   final Api api = Api();
//   AttendanceService attendanceService = AttendanceService();
//   List<AttendanceModel> attendance = [];
//   bool isLoading = false;
//   String error = "";

//   Future<void> fetchAttendance() async {
//     isLoading = true;
//     notifyListeners();
//     try {
//       attendance = await attendanceService.getAttendance();

//       isLoading = false;
//       notifyListeners();
//     } catch (e) {
//       error = e.toString();
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:sib_attendance/models/attendance_model.dart';
import 'package:sib_attendance/provider/monthly_attendance_provider.dart';
import 'package:sib_attendance/service/attendance_service.dart';

class AttendanceProvider extends ChangeNotifier {
  AttendanceService attendanceService = AttendanceService();

  List<AttendanceModel> attendance = [];
  bool isLoading = false;
  String error = "";

  Future<void> fetchAttendance({
    required MonthlyAttendanceProvider monthlyProvider,
    String? code,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      attendance = await attendanceService.getAttendance(
        from: monthlyProvider.from,
        to: monthlyProvider.to,
        employeeCode: code ?? '',
      );
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
