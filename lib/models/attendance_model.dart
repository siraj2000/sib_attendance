class AttendanceModel {
  final int id;
  final int bioId;
  final int employeeId;
  final String employeeCode;
  final DateTime punchTime;
  final String state;
  final String verifyType;
  final String terminalSn;
  final String terminalAlias;
  final String area;
  final DateTime createdAt;
  final DateTime updatedAt;

  // 👇 بيانات الموظف (اختيارية)
  final int? empId;
  final String? empCode;
  final String? fullName;
  final String? firstName;
  final String? lastName;
  final String? photo;
  final String? hireDate;
  final String? mobile;
  final String? email;
  final int? departmentId;
  final int? positionId;
  final int? workScheduleId;

  AttendanceModel({
    required this.id,
    required this.bioId,
    required this.employeeId,
    required this.employeeCode,
    required this.punchTime,
    required this.state,
    required this.verifyType,
    required this.terminalSn,
    required this.terminalAlias,
    required this.area,
    required this.createdAt,
    required this.updatedAt,
    this.empId,
    this.empCode,
    this.fullName,
    this.firstName,
    this.lastName,
    this.photo,
    this.hireDate,
    this.mobile,
    this.email,
    this.departmentId,
    this.positionId,
    this.workScheduleId,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    final employee = json['employee'];

    return AttendanceModel(
      id: json['id'],
      bioId: json['bio_id'],
      employeeId: json['employee_id'],
      employeeCode: json['employee_code'],
      punchTime: DateTime.parse(json['punch_time']),
      state: json['state'],
      verifyType: json['verify_type'],
      terminalSn: json['terminal_sn'],
      terminalAlias: json['terminal_alias'],
      area: json['area'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),

      // employee (لو موجود)
      empId: employee?['id'],
      empCode: employee?['emp_code'],
      fullName: employee?['full_name'],
      firstName: employee?['first_name'],
      lastName: employee?['last_name'],
      photo: employee?['photo'],
      hireDate: employee?['hire_date'],
      mobile: employee?['mobile'],
      email: employee?['email'],
      departmentId: employee?['department_id'],
      positionId: employee?['position_id'],
      workScheduleId: employee?['work_schedule_id'],
    );
  }
}
// class AttendanceModel {
//   final int id;
//   final int bioId;
//   final int employeeId;
//   final String employeeCode;
//   final DateTime punchTime;
//   final String state;
//   final String verifyType;
//   final String terminalSn;
//   final String terminalAlias;
//   final String area;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   AttendanceModel({
//     required this.id,
//     required this.bioId,
//     required this.employeeId,
//     required this.employeeCode,
//     required this.punchTime,
//     required this.state,
//     required this.verifyType,
//     required this.terminalSn,
//     required this.terminalAlias,
//     required this.area,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory AttendanceModel.fromJson(Map<String, dynamic> json) {
//     return AttendanceModel(
//       id: json['id'],
//       bioId: json['bio_id'],
//       employeeId: json['employee_id'],
//       employeeCode: json['employee_code'],
//       punchTime: DateTime.parse(json['punch_time']),
//       state: json['state'],
//       verifyType: json['verify_type'],
//       terminalSn: json['terminal_sn'],
//       terminalAlias: json['terminal_alias'],
//       area: json['area'],
//       createdAt: DateTime.parse(json['created_at']),
//       updatedAt: DateTime.parse(json['updated_at']),
//     );
//   }
// }
