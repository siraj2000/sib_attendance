// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sib_attendance/provider/user_provider.dart';
// import 'package:sib_attendance/widget/custom_text.dart';
// import 'package:sib_attendance/widget/emloyee_card.dart';
// import 'package:sib_attendance/widget/serach_delegate.dart';

// class EmployeeViews extends StatefulWidget {
//   const EmployeeViews({super.key});

//   @override
//   State<EmployeeViews> createState() => _EmployeeViewsState();
// }

// class _EmployeeViewsState extends State<EmployeeViews> {
//   @override
//   void initState() {
//     super.initState();
//     // نجيب الداتا مرة وحدة
//     Future.microtask(() {
//       context.read<UserProvider>().fetchUsers();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: CustomText(text: "Employees", size: 14),
//         actions: [
//           Consumer<UserProvider>(
//             builder: (context, provider, _) {
//               return IconButton(
//                 icon: const Icon(Icons.search),
//                 onPressed: provider.users.isEmpty
//                     ? null
//                     : () {
//                         showSearch(
//                           context: context,
//                           delegate: EmployeeSearchDelegate(provider.users),
//                         );
//                       },
//               );
//             },
//           ),
//         ],
//       ),
//       body: Consumer<UserProvider>(
//         builder: (context, provider, _) {
//           if (provider.isLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (provider.error.isNotEmpty) {
//             return Center(child: CustomText(text: provider.error));
//           }

//           if (provider.users.isEmpty) {
//             return Center(child: CustomText(text: "No data found"));
//           }
//           return ListView.builder(
//             itemCount: provider.users.length,
//             itemBuilder: (context, index) {
//               return EmployeeCard(usersMap: provider.users[index]);
//             },
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sib_attendance/provider/user_provider.dart';
import 'package:sib_attendance/widget/custom_text.dart';
import 'package:sib_attendance/widget/emloyee_card.dart';
import 'package:sib_attendance/widget/search_text_field.dart';

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
      appBar: AppBar(title: CustomText(text: "Employees", size: 14)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchTextField(
              hintText: "Search .........",
              onChanged: (value) {
                context.read<UserProvider>().fetchUsers(code: value);
              },
            ),
            Consumer<UserProvider>(
              builder: (context, provider, _) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (provider.error.isNotEmpty) {
                  return Center(child: CustomText(text: provider.error));
                }

                if (provider.users.isEmpty) {
                  return Center(child: CustomText(text: "No data found"));
                }
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: provider.users.length,
                  itemBuilder: (context, index) {
                    return EmployeeCard(usersMap: provider.users[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
