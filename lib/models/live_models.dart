// class Livemodels {
//     int? id;
//     int? bioId;
//     int? employeeId;
//     String? employeeCode;
//     DateTime? punchTime;
//     String? state;
//     String? verifyType;
//     String? terminalSn;
//     String? terminalAlias;
//     String? area;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     Employee? employee;

//     Livemodels({
//         this.id,
//         this.bioId,
//         this.employeeId,
//         this.employeeCode,
//         this.punchTime,
//         this.state,
//         this.verifyType,
//         this.terminalSn,
//         this.terminalAlias,
//         this.area,
//         this.createdAt,
//         this.updatedAt,
//         this.employee,
//     });

// }

// class Employee {
//     int? id;
//     String? empCode;
//     String? fullName;
//     String? firstName;
//     String? lastName;
//     dynamic photo;
//     DateTime? hireDate;
//     dynamic mobile;
//     dynamic email;
//     int? departmentId;
//     int? positionId;
//     int? workScheduleId;
//     DateTime? createdAt;
//     DateTime? updatedAt;

//     Employee({
//         this.id,
//         this.empCode,
//         this.fullName,
//         this.firstName,
//         this.lastName,
//         this.photo,
//         this.hireDate,
//         this.mobile,
//         this.email,
//         this.departmentId,
//         this.positionId,
//         this.workScheduleId,
//         this.createdAt,
//         this.updatedAt,
//     });

// }
// import 'package:sib_attendance/models/empolyee_models.dart';

// class LiveModels {
//   int? id;
//   int? bioId;
//   int? employeeId;
//   String? employeeCode;
//   DateTime? punchTime;
//   String? state;
//   String? verifyType;
//   String? terminalSn;
//   String? terminalAlias;
//   String? area;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   EmployeeModel? employee;

//   LiveModels({
//     this.id,
//     this.bioId,
//     this.employeeId,
//     this.employeeCode,
//     this.punchTime,
//     this.state,
//     this.verifyType,
//     this.terminalSn,
//     this.terminalAlias,
//     this.area,
//     this.createdAt,
//     this.updatedAt,
//     this.employee,
//   });

//   factory LiveModels.fromJson(Map<String, dynamic> json) {
//     return LiveModels(
//       id: json['id'],
//       bioId: json['bio_id'],
//       employeeId: json['employee_id'],
//       employeeCode: json['employee_code'],
//       punchTime: json['punch_time'] != null
//           ? DateTime.parse(json['punch_time'])
//           : null,
//       state: json['state'],
//       verifyType: json['verify_type'],
//       terminalSn: json['terminal_sn'],
//       terminalAlias: json['terminal_alias'],
//       area: json['area'],
//       createdAt: json['created_at'] != null
//           ? DateTime.parse(json['created_at'])
//           : null,
//       updatedAt: json['updated_at'] != null
//           ? DateTime.parse(json['updated_at'])
//           : null,

//       /// ✅ أهم سطر
//       employee: json['employee'] is Map<String, dynamic>
//           ? EmployeeModel.fromJson(json['employee'])
//           : null,
//     );
//   }
// }
import 'package:sib_attendance/models/empolyee_models.dart';

class LiveModels {
  int? id;
  int? bioId;
  int? employeeId;
  String? employeeCode;
  DateTime? punchTime;
  String? state;
  String? verifyType;
  String? terminalSn;
  String? terminalAlias;
  String? area;
  DateTime? createdAt;
  DateTime? updatedAt;
  EmployeeModel? employee;

  LiveModels({
    this.id,
    this.bioId,
    this.employeeId,
    this.employeeCode,
    this.punchTime,
    this.state,
    this.verifyType,
    this.terminalSn,
    this.terminalAlias,
    this.area,
    this.createdAt,
    this.updatedAt,
    this.employee,
  });

  factory LiveModels.fromJson(Map<String, dynamic> json) {
    return LiveModels(
      id: json['id'],
      bioId: json['bio_id'],
      employeeId: json['employee_id'],
      employeeCode: json['employee_code'],
      punchTime: json['punch_time'] != null
          ? DateTime.tryParse(json['punch_time'])
          : null,
      state: json['state'],
      verifyType: json['verify_type'],
      terminalSn: json['terminal_sn'],
      terminalAlias: json['terminal_alias'],
      area: json['area'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,

      employee:
          json['employee'] != null && json['employee'] is Map<String, dynamic>
          ? EmployeeModel.fromJson(json['employee'] as Map<String, dynamic>)
          : null,
    );
  }
}
