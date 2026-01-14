class AttendanceSearchRequest {
  final String employeeCode;
  final DateTime fromDate;
  final DateTime toDate;

  AttendanceSearchRequest({
    required this.employeeCode,
    required this.fromDate,
    required this.toDate,
  });

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  Map<String, dynamic> toQueryParameters() {
    return {
      "employee_code": employeeCode,
      "from": _formatDate(fromDate),
      "to": _formatDate(toDate),
    };
  }
}
