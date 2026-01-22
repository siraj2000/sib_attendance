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
