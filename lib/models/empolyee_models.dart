class EmployeeModel {
  final int id;
  final String empCode;
  final String fullName;
  final Department department;
  final Position? position;

  EmployeeModel({
    required this.id,
    required this.empCode,
    required this.fullName,
    required this.department,
    this.position,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    final departmentJson = json['department'];

    return EmployeeModel(
      id: json['id'],
      empCode: json['emp_code'],
      fullName: json['full_name'],

      /// 👇 الحل هنا
      department: departmentJson is Map<String, dynamic>
          ? Department.fromJson(departmentJson)
          : Department(id: 0, deptName: departmentJson?.toString() ?? ""),

      position: json['position'] != null && json['position'] is Map
          ? Position.fromJson(json['position'])
          : null,
    );
  }
}
// class EmployeeModel {
//   final int id;
//   final String empCode;
//   final String fullName;
//   final String department; // ✅ String
//   final String? position;

//   EmployeeModel({
//     required this.id,
//     required this.empCode,
//     required this.fullName,
//     required this.department,
//     this.position,
//   });

//   factory EmployeeModel.fromJson(Map<String, dynamic> json) {
//     return EmployeeModel(
//       id: json['id'],
//       empCode: json['emp_code'],
//       fullName: json['full_name'],
//       department: json['department']?.toString() ?? "",
//       position: json['position']?.toString(),
//     );
//   }
// }

class Department {
  final int id;
  final String deptName;

  Department({required this.id, required this.deptName});

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(id: json['id'], deptName: json['dept_name']);
  }
}

class Position {
  final int id;
  final String positionName;

  Position({required this.id, required this.positionName});

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(id: json['id'], positionName: json['position_name']);
  }
}
