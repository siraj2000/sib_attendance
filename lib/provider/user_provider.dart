import 'package:flutter/material.dart';
import 'package:sib_attendance/models/empolyee_models.dart';
import 'package:sib_attendance/service/user_service.dart';

class UserProvider extends ChangeNotifier {
  UserService service = UserService();

  // List<EmployeeModel> allUsers = [];
  List<EmployeeModel> users = [];
  bool isLoading = false;
  String error = "";

  // GET ALL USERS
  Future<void> fetchUsers({String? code}) async {
    isLoading = true;
    notifyListeners();
    try {
      users = await service.getUsers(code);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }
}
