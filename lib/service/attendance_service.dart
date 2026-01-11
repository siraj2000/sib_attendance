import 'package:sib_attendance/models/empolyee_models.dart';
import 'package:sib_attendance/network/api.dart';

class DepartmentsService {
  final Api api = Api();
  Future<List<Department>> getDepartments() async {
    final response = await api.dio.get("${Api.baseUrl}/api/departments");
    print(response.data);
    final List data = response.data["data"];
    return data
        .map((e) => Department.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
