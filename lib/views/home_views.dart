import 'package:flutter/material.dart';
import 'package:sib_attendance/widget/custom_text.dart';
import 'package:sib_attendance/widget/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),

      appBar: AppBar(
        title:
            // ===== Title =====
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CustomText(text: "Home", size: 14),
            ),

        // زر القائمة (☰)
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),

      body: const Center(child: Text("Home Page")),
    );
  }
}
