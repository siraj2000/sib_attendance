// import 'package:flutter/material.dart';
// import 'package:sib_attendance/widget/custom_text.dart';
// import 'package:sib_attendance/widget/live_card.dart';

// class LiveViews extends StatefulWidget {
//   const LiveViews({super.key});

//   @override
//   State<LiveViews> createState() => _LiveViewsState();
// }

// class _LiveViewsState extends State<LiveViews> {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController searchController = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(title: CustomText(text: "Live Screen", size: 14)),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: TextFormField(
//                 controller: searchController,
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   prefixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey.shade300),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ),
//             Text(
//               searchController.value.text.trim().isEmpty
//                   ? "name"
//                   : searchController.text,
//             ),
//             SizedBox(height: 10),

//             ListView.separated(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemBuilder: (context, index) => LiveCard(),

//               separatorBuilder: (context, index) => SizedBox(height: 6),
//               itemCount: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:dio/io.dart';
// import 'package:flutter/material.dart';
// import 'package:sib_attendance/utils/app_colors.dart';
// import 'package:sib_attendance/widget/custom_text.dart';
// import 'package:sib_attendance/widget/live_card.dart';
// import 'package:sib_attendance/models/live_models.dart';

// class LiveViews extends StatefulWidget {
//   const LiveViews({super.key});

//   @override
//   State<LiveViews> createState() => _LiveViewsState();
// }

// class _LiveViewsState extends State<LiveViews> {
//   late Future<List<LiveModels>> liveFuture;
//   List<LiveModels> allLive = [];
//   final Dio dio = Dio()
//     ..httpClientAdapter = IOHttpClientAdapter(
//       createHttpClient: () {
//         final client = HttpClient();
//         client.badCertificateCallback =
//             (X509Certificate cert, String host, int port) => true;
//         return client;
//       },
//     );

//   final String baseUrl = "https://172.16.19.11";
//   Future<List<LiveModels>> getLive() async {
//     final response = await dio.get("$baseUrl/api/live");

//     debugPrint("FULL RESPONSE TYPE: ${response.data.runtimeType}");

//     if (response.data is! List) {
//       throw Exception("API response is not a List");
//     }

//     final List data = response.data;

//     return data
//         .map((e) => LiveModels.fromJson(e as Map<String, dynamic>))
//         .toList();
//   }

//   initState() {
//     super.initState();
//     liveFuture = getLive();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: CustomText(text: "Live Screen", size: 14)),
//       body: RefreshIndicator(
//         onRefresh: () async {
//           liveFuture = getLive();
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// 🔍 Search
//             // Padding(
//             //   padding: const EdgeInsets.all(10.0),
//             //   child: TextFormField(
//             //     decoration: InputDecoration(
//             //       hintText: "Search",
//             //       prefixIcon: Icon(Icons.search),
//             //       border: OutlineInputBorder(
//             //         borderRadius: BorderRadius.circular(10),
//             //       ),
//             //     ),
//             //   ),
//             // ),
//             SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: CustomText(
//                 text: "Latest Attendance Logs",
//                 color: const Color.fromARGB(255, 129, 124, 124),
//                 size: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 5),

//             /// 📡 API DATA
//             Expanded(
//               child: FutureBuilder<List<LiveModels>>(
//                 future: liveFuture,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   }

//                   if (snapshot.hasError) {
//                     return Center(child: Text("Error: ${snapshot.error}"));
//                   }

//                   if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return Center(child: Text("No Live Data"));
//                   }

//                   final lives = snapshot.data!;

//                   return ListView.separated(
//                     itemCount: lives.length,
//                     separatorBuilder: (_, __) => SizedBox(height: 6),
//                     itemBuilder: (context, index) {
//                       return LiveCard(model: lives[index]);
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sib_attendance/provider/live_provider.dart';
import 'package:sib_attendance/widget/custom_text.dart';
import 'package:sib_attendance/widget/live_card.dart';

class LiveViews extends StatefulWidget {
  const LiveViews({super.key});

  @override
  State<LiveViews> createState() => _LiveViewsState();
}

class _LiveViewsState extends State<LiveViews> {
  initState() {
    Future.microtask(() {
      context.read<LiveProvider>().fetchLive();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText(text: "Live Screen", size: 14)),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<LiveProvider>().fetchLive();
        },
        child: Consumer<LiveProvider>(
          builder: (context, provider, _) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (provider.error.isNotEmpty) {
              return Center(child: Text(provider.error));
            }

            if (provider.live.isEmpty) {
              return const Center(child: Text("No data found"));
            }

            return ListView.builder(
              itemCount: provider.live.length,
              itemBuilder: (context, index) {
                return LiveCard(model: provider.live[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
