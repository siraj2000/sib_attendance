import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sib_attendance/models/user_models.dart';

import 'package:sib_attendance/widget/custom_text.dart';
import 'package:sib_attendance/widget/emloyee_card.dart';

class EmployeeViews extends StatefulWidget {
  const EmployeeViews({super.key});

  @override
  State<EmployeeViews> createState() => _EmployeeViewsState();
}

class _EmployeeViewsState extends State<EmployeeViews> {
  final Dio _dio = Dio();
  late Future<List<UserModel>> usersFuture;

  @override
  void initState() {
    super.initState();
    usersFuture = getUsers();
  }

  Future<List<UserModel>> getUsers() async {
    final response = await _dio.get("https://dummyjson.com/users");

    final List rawUsers = response.data["users"] as List;

    return rawUsers
        .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText(text: "Employees", size: 14)),
      body: FutureBuilder<List<UserModel>>(
        future: usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) =>
                  EmployeeCard(usersMap: users[index]),
            );
          } else {
            return Center(child: Text("No data found"));
          }
        },
      ),
    );
  }
}
