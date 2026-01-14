// import 'package:sib_attendance/models/attendance_model.dart';
// import 'package:sib_attendance/network/api.dart';

// class AttendanceService {
//   final Api api = Api();
//   Future<List<AttendanceModel>> getAttendance() async {
//     final response = await api.dio.get(
//       "${Api.baseUrl}/api/attendance?from=2025-12-01&to=2026-01-25&employee_code=30",
//     );
//     print(response.data);
//     final List data = response.data["data"];
//     return data
//         .map((e) => AttendanceModel.fromJson(e as Map<String, dynamic>))
//         .toList();
//   }
// }

import 'package:sib_attendance/models/attendance_model.dart';
import 'package:sib_attendance/network/api.dart';

class AttendanceService {
  final Api api = Api();

  Future<List<AttendanceModel>> getAttendance({
    required String from,
    required String to,
    required String employeeCode,
  }) async {
    final response = await api.dio.get(
      "${Api.baseUrl}/api/attendance",
      queryParameters: {"from": from, "to": to, "employee_code": employeeCode},
    );

    final List data = response.data["data"];
    return data
        .map((e) => AttendanceModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
