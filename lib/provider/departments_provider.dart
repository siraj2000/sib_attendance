import 'package:flutter/material.dart';
import 'package:sib_attendance/models/empolyee_models.dart';
import 'package:sib_attendance/service/attendance_service.dart';

class DepartmentsProvider extends ChangeNotifier {
  DepartmentsService service = DepartmentsService();
  List<Department> departments = [];
  bool isLoading = false;
  String error = "";

  Future<void> fetchDepartments() async {
    isLoading = true;
    notifyListeners();
    try {
      departments = await service.getDepartments();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }
}
