import 'package:flutter/material.dart';
import 'package:sib_attendance/models/live_models.dart';
import 'package:sib_attendance/service/live_service.dart';

class LiveProvider extends ChangeNotifier {
  LiveService service = LiveService();
  List<LiveModels> live = [];
  bool isLoading = false;
  String error = "";
  Future<void> fetchLive() async {
    isLoading = true;
    notifyListeners();
    try {
      live = await service.getLive();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }
}
