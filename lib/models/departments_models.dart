class Department {
  final int id;
  final String deptCode;
  final String deptName;

  Department({
    required this.id,
    required this.deptCode,
    required this.deptName,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id'] as int,
      deptCode: (json['dept_code'] ?? '').toString(),
      deptName: (json['dept_name'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'dept_code': deptCode,
    'dept_name': deptName,
  };
}

class DepartmentsResponse {
  final int count;
  final List<Department> data;

  DepartmentsResponse({required this.count, required this.data});

  factory DepartmentsResponse.fromJson(Map<String, dynamic> json) {
    final list = (json['data'] as List? ?? [])
        .map((e) => Department.fromJson(e as Map<String, dynamic>))
        .toList();

    return DepartmentsResponse(count: (json['count'] ?? 0) as int, data: list);
  }

  Map<String, dynamic> toJson() => {
    'count': count,
    'data': data.map((e) => e.toJson()).toList(),
  };
}
