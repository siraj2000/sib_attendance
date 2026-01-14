import 'package:sib_attendance/models/empolyee_models.dart';

class LiveModels {
  int? id;
  int? bioId;
  int? employeeId;
  String? employeeCode;
  DateTime? punchTime;
  String? state;
  String? verifyType;
  String? fullName;
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
