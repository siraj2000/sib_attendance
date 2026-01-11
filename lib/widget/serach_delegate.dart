import 'package:flutter/material.dart';
import 'package:sib_attendance/models/empolyee_models.dart';
import 'package:sib_attendance/widget/emloyee_card.dart';

class EmployeeSearchDelegate extends SearchDelegate<EmployeeModel?> {
  final List<EmployeeModel> employees;

  EmployeeSearchDelegate(this.employees);

  @override
  String get searchFieldLabel => "ابحث بالاسم أو الرقم";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ""),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _filterEmployees();
    return _buildList(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = _filterEmployees();
    return _buildList(results);
  }

  List<EmployeeModel> _filterEmployees() {
    final q = query;

    //if (q.isEmpty) return employees;

    return employees.where((emp) {
      // ✅ عدّل حسب حقول الموديل عندك
      final name = (emp.fullName ?? "");
      final id = (emp.empCode ?? "").toString();
      // لو عندك empNo بدل id غيره

      return name.contains(q) ||
          id.contains(
            q,
          ); // يظهر في النتائج لو الاسم فيه الكلمة    أو  الرقم فيه الكلمة
    }).toList();
  }

  Widget _buildList(List<EmployeeModel> results) {
    if (results.isEmpty) {
      return const Center(child: Text("لا يوجد نتائج"));
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return EmployeeCard(usersMap: results[index]);
      },
    );
  }
}
