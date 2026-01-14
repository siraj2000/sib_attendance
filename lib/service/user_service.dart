import 'package:sib_attendance/models/empolyee_models.dart';
import 'package:sib_attendance/network/api.dart';

class UserService {
  final Api api = Api();
  Future<List<EmployeeModel>> getUsers(String? code) async {
    final response = await api.dio.get(
      "${Api.baseUrl}/api/employees",
      data: {if (code != null) 'emp_code': code},
    );
    print(response.data);
    final List data = response.data["data"];
    return data
        .map((e) => EmployeeModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:dio/io.dart';
// import 'package:sib_attendance/models/empolyee_models.dart';

// class UserService {
//   static const String baseUrl = "https://172.16.19.11";

//   final Dio dio = Dio()
//     ..httpClientAdapter = IOHttpClientAdapter(
//       createHttpClient: () {
//         final client = HttpClient();
//         client.badCertificateCallback =
//             (X509Certificate cert, String host, int port) => true;
//         return client;
//       },
//     );

//   /// GET all users
//   Future<List<EmployeeModel>> getUsers() async {
//     final response = await dio.get("$baseUrl/api/employees");
//     final List data = response.data["data"];
//     return data
//         .map((e) => EmployeeModel.fromJson(e as Map<String, dynamic>))
//         .toList();
//   }

//   /// POST - create new user
//   Future<EmployeeModel> createUser(EmployeeModel employee) async {
//     final response = await dio.post(
//       "$baseUrl/api/employees",
      
//     );

//     return EmployeeModel.fromJson(response.data["data"]);
//   }

//   /// PUT - update user
//   Future<EmployeeModel> updateUser({
//     required int id,
//     required EmployeeModel employee,
//   }) async {
//     final response = await dio.put(
//       "$baseUrl/api/employees/$id",
     
//     );

//     return EmployeeModel.fromJson(response.data["data"]);
//   }

//   /// DELETE - delete user
//   Future<void> deleteUser(int id) async {
//     await dio.delete("$baseUrl/api/employees/$id");
//   }
// }

