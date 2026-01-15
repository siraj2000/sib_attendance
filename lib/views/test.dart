import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sib_attendance/models/attendance_model.dart';
import 'package:sib_attendance/models/empolyee_models.dart';
import 'package:sib_attendance/provider/monthly_attendance_provider.dart';
import 'package:sib_attendance/provider/user_provider.dart';
import 'package:sib_attendance/widget/custom_text.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    super.initState();

    /// أول تحميل بدون قيم ثابتة
    Future.microtask(() {
      context.read<UserProvider>().fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B2B4A),
        title: const Text(
          "My Attendance",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Top spacing replaced by Padding
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue.withOpacity(0.6)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "2",
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: CustomText(
                              text: "Early Leave",
                              color: Colors.grey,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(width: 8),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.purple.withOpacity(0.6),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "1", color: Colors.purple, size: 20),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: CustomText(
                              text: "Absents",
                              color: Colors.grey,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red.withOpacity(0.6)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "0", color: Colors.red, size: 20),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: CustomText(
                              text: "Late in",
                              color: Colors.grey,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(width: 8),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.orange.withOpacity(0.6),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "5", color: Colors.orange, size: 20),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: CustomText(
                              text: "Leaves",
                              color: Colors.grey,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Week 1",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Container(width: 8),
                        const Text(
                          "07-13 Jan",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_down),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: const [
                                    CustomText(text: "07", size: 14),
                                    // Replace as requested
                                    CustomText(
                                      text: "wen",
                                      color: Colors.grey,
                                      size: 14,
                                    ),
                                  ],
                                ),
                              ),
                              Container(width: 12),
                              Expanded(
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.login,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child:
                                          //  Text(
                                          //   "09:00 PM",
                                          //   style: TextStyle(
                                          //     fontWeight: FontWeight.w600,
                                          //   ),
                                          // ),
                                          Consumer<UserProvider>(
                                            builder: (context, pro, child) {
                                              return CustomText(text: "09:00");
                                            },
                                          ),
                                    ),
                                    const Text(
                                      "Check in",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 40,
                                color: Colors.black12,
                              ),
                              Expanded(
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.logout,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 4),
                                      child: Text(
                                        "05:00 PM",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Check out",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 40,
                                color: Colors.black12,
                              ),
                              Expanded(
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.timelapse,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 4),
                                      child: Text(
                                        "7h 50m",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Total Hours",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    children: const [
                                      Text(
                                        "13",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // Replace as requested
                                      CustomText(
                                        text: "Wen",
                                        color: Colors.grey,
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(width: 12),
                                Expanded(
                                  child: Column(
                                    children: const [
                                      Icon(
                                        Icons.login,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 4),
                                        child: Text(
                                          "09:00 AM",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Check in",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 40,
                                  color: Colors.black12,
                                ),
                                Expanded(
                                  child: Column(
                                    children: const [
                                      Icon(
                                        Icons.logout,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 4),
                                        child: Text(
                                          "05:00 PM",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Check out",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 40,
                                  color: Colors.black12,
                                ),
                                Expanded(
                                  child: Column(
                                    children: const [
                                      Icon(
                                        Icons.timelapse,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 4),
                                        child: Text(
                                          "7h 50m",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Total Hours",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
