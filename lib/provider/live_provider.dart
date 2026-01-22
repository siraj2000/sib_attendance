import 'package:flutter/material.dart';
import 'package:sib_attendance/models/live_attendance.dart';
import 'package:sib_attendance/models/live_models.dart';
import 'package:sib_attendance/service/live_service.dart';

class LiveProvider extends ChangeNotifier {
  LiveService service = LiveService();

  List<LiveModels> live = [];
  int count = 0;
  int inside = 0;
  int outside = 0;

  bool isLoading = false;
  String error = "";

  Future<void> fetchLive() async {
    isLoading = true;
    error = "";
    notifyListeners();

    try {
      final LiveAttendance response = await service.getLive();

      live = response.data ?? [];
      count = response.count ?? 0;
      inside = response.inside ?? 0;
      outside = response.outside ?? 0;

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }
}
