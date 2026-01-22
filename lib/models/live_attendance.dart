import 'package:sib_attendance/models/live_models.dart';

class LiveAttendance {
  int? count;
  int? inside;
  int? outside;
  List<LiveModels>? data;

  LiveAttendance({this.count, this.inside, this.outside, this.data});

  factory LiveAttendance.fromJson(Map<String, dynamic> json) {
    return LiveAttendance(
      count: json['count'],
      inside: json['inside'],
      outside: json['outside'],
      data: json['data'] != null
          ? List<LiveModels>.from(
              json['data'].map((e) => LiveModels.fromJson(e)),
            )
          : [],
    );
  }
}
