// // // import 'package:dio/dio.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:sib_attendance/models/empolyee_models.dart';
// // // import 'package:sib_attendance/widget/custom_text.dart';
// // // import 'package:sib_attendance/widget/emloyee_card.dart';

// // // class EmployeeViews extends StatefulWidget {
// // //   const EmployeeViews({super.key});

// // //   @override
// // //   State<EmployeeViews> createState() => _EmployeeViewsState();
// // // }

// // // class _EmployeeViewsState extends State<EmployeeViews> {
// // //   late Future<List<EmployeeModel>> usersFuture;

// // //   final Dio _dio = Dio(
// // //     BaseOptions(
// // //       sendTimeout: const Duration(seconds: 10),
// // //       connectTimeout: const Duration(seconds: 10),
// // //       receiveTimeout: const Duration(seconds: 10),
// // //     ),
// // //   );

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     usersFuture = getUsers();
// // //   }

// // //   Future<List<EmployeeModel>> getUsers() async {
// // //     try {
// // //       final response = await _dio.get("http://172.16.19.11/api/employees");

// // //       final List rawUsers = response.data["data"] as List;

// // //       return rawUsers
// // //           .map((e) => EmployeeModel.fromJson(e as Map<String, dynamic>))
// // //           .toList();
// // //     } catch (e) {
// // //       rethrow;
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: CustomText(text: "Employees", size: 14)),
// // //       body: FutureBuilder<List<EmployeeModel>>(
// // //         future: usersFuture,
// // //         builder: (context, snapshot) {
// // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // //             return const Center(child: CircularProgressIndicator());
// // //           } else if (snapshot.hasError) {
// // //             return Center(child: Text(snapshot.error.toString()));
// // //           } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
// // //             final users = snapshot.data!;
// // //             return ListView.builder(
// // //               itemCount: users.length,
// // //               itemBuilder: (context, index) =>
// // //                   EmployeeCard(usersMap: users[index]),
// // //             );
// // //           } else {
// // //             return const Center(child: Text("No data found"));
// // //           }
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:dio/dio.dart';
// // import 'package:flutter/material.dart';
// // import 'package:sib_attendance/models/empolyee_models.dart';
// // import 'package:sib_attendance/widget/custom_text.dart';
// // import 'package:sib_attendance/widget/emloyee_card.dart';

// // class EmployeeViews extends StatefulWidget {
// //   const EmployeeViews({super.key});

// //   @override
// //   State<EmployeeViews> createState() => _EmployeeViewsState();
// // }

// // class _EmployeeViewsState extends State<EmployeeViews> {
// //   late Future<List<EmployeeModel>> usersFuture;

// //   final Dio _dio = Dio(
// //     BaseOptions(
// //       connectTimeout: const Duration(seconds: 10),
// //       receiveTimeout: const Duration(seconds: 10),
// //       sendTimeout: const Duration(seconds: 10),
// //     ),
// //   );

// //   final String baseUrl = "http://172.16.19.11"; // Emulator ONLY

// //   @override
// //   void initState() {
// //     super.initState();
// //     usersFuture = getUsers();
// //   }

// //   Future<List<EmployeeModel>> getUsers() async {
// //     final response = await _dio.get("$baseUrl/api/employees");
// //     final List data = response.data["data"];
// //     return data.map((e) => EmployeeModel.fromJson(e)).toList();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: CustomText(text: "Employees", size: 14)),
// //       body: FutureBuilder<List<EmployeeModel>>(
// //         future: usersFuture,
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text(snapshot.error.toString()));
// //           } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
// //             return ListView.builder(
// //               itemCount: snapshot.data!.length,
// //               itemBuilder: (context, index) =>
// //                   EmployeeCard(usersMap: snapshot.data![index]),
// //             );
// //           } else {
// //             return const Center(child: Text("No data found"));
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:dio/io.dart';
// import 'package:flutter/material.dart';
// import 'package:sib_attendance/models/empolyee_models.dart';
// import 'package:sib_attendance/widget/custom_text.dart';
// import 'package:sib_attendance/widget/emloyee_card.dart';
// import 'package:sib_attendance/widget/serach_delegate.dart';

// class EmployeeViews extends StatefulWidget {
//   const EmployeeViews({super.key});

//   @override
//   State<EmployeeViews> createState() => _EmployeeViewsState();
// }

// class _EmployeeViewsState extends State<EmployeeViews> {
//   late Future<List<EmployeeModel>> usersFuture;
//   List<EmployeeModel> allEmployees = [];
//   final dio = Dio()
//     ..httpClientAdapter = IOHttpClientAdapter(
//       createHttpClient: () {
//         final client = HttpClient();
//         client.badCertificateCallback =
//             (X509Certificate cert, String host, int port) => true;
//         return client;
//       },
//     );

//   final String baseUrl = "https://172.16.19.11";

//   @override
//   void initState() {
//     super.initState();
//     usersFuture = getUsers();
//   }

//   Future<List<EmployeeModel>> getUsers() async {
//     final response = await dio.get("$baseUrl/api/employees");
//     print(response.data);
//     final List data = response.data["data"];
//     return data
//         .map((e) => EmployeeModel.fromJson(e as Map<String, dynamic>))
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: CustomText(text: "Employees", size: 14),
//         actions: [
//           IconButton(
//             onPressed: () async {
//               if (allEmployees.isEmpty) {
//                 // لو البيانات لسا ما جتش
//                 final users = await usersFuture;
//                 allEmployees = users;
//               }

//               showSearch(
//                 context: context,
//                 delegate: EmployeeSearchDelegate(allEmployees),
//               );
//             },
//             icon: const Icon(Icons.search),
//           ),
//         ],
//       ),
//       body: FutureBuilder<List<EmployeeModel>>(
//         future: usersFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return Center(child: Text(snapshot.error.toString()));
//           }

//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text("No data found"));
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               return EmployeeCard(usersMap: snapshot.data![index]);
//             },
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sib_attendance/models/empolyee_models.dart';
import 'package:sib_attendance/provider/user_provider.dart';
import 'package:sib_attendance/widget/custom_text.dart';
import 'package:sib_attendance/widget/emloyee_card.dart';
import 'package:sib_attendance/widget/serach_delegate.dart';

class EmployeeViews extends StatefulWidget {
  const EmployeeViews({super.key});

  @override
  State<EmployeeViews> createState() => _EmployeeViewsState();
}

class _EmployeeViewsState extends State<EmployeeViews> {
  @override
  void initState() {
    super.initState();
    // نجيب الداتا مرة وحدة
    Future.microtask(() {
      context.read<UserProvider>().fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Employees", size: 14),
        actions: [
          Consumer<UserProvider>(
            builder: (context, provider, _) {
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: provider.users.isEmpty
                    ? null
                    : () {
                        showSearch(
                          context: context,
                          delegate: EmployeeSearchDelegate(provider.users),
                        );
                      },
              );
            },
          ),
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error.isNotEmpty) {
            return Center(child: Text(provider.error));
          }

          if (provider.users.isEmpty) {
            return const Center(child: Text("No data found"));
          }

          return ListView.builder(
            itemCount: provider.users.length,
            itemBuilder: (context, index) {
              return EmployeeCard(usersMap: provider.users[index]);
            },
          );
        },
      ),
    );
  }
}
