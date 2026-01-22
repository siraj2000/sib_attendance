import 'package:flutter/material.dart';

class MonthlyAttendanceProvider extends ChangeNotifier {
  DateTimeRange range = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 30)),
    end: DateTime.now(),
  );

  final TextEditingController searchController = TextEditingController();
  String searchText = "";

  /// فرق الأيام
  int get differenceInDays => range.end.difference(range.start).inDays + 1;

  /// من
  String get from => range.start.toIso8601String().split('T').first;

  /// إلى
  String get to => range.end.toIso8601String().split('T').first;

  /// رقم الموظف
  String get employeeCode => searchText;

  String get fullName => searchText;

  /// البحث
  void onSearchChanged(String value) {
    searchText = value;
    notifyListeners();
  }

  /// 📅 اختيار فترة التاريخ
  Future<void> pickDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
      initialDateRange: range,
    );

    if (picked != null) {
      range = picked;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
