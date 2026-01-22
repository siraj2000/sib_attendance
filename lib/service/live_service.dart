// import 'package:sib_attendance/models/live_models.dart';
// import 'package:sib_attendance/network/api.dart';

// class LiveService {
//   final Api api = Api();
//   Future<List<LiveModels>> getLive() async {
//     final response = await api.dio.get("${Api.baseUrl}/api/live");
//     print(response.data);

//     final List data = response.data;
//     return data
//         .map((e) => LiveModels.fromJson(e as Map<String, dynamic>))
//         .toList();
//   }
// }
import 'package:sib_attendance/models/live_attendance.dart';
import 'package:sib_attendance/network/api.dart';

class LiveService {
  final Api api = Api();

  Future<LiveAttendance> getLive() async {
    final response = await api.dio.get("${Api.baseUrl}/api/live");

    // Debug
    print(response.data);

    return LiveAttendance.fromJson(response.data as Map<String, dynamic>);
  }
}
