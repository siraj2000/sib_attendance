import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sib_attendance/provider/live_provider.dart';
import 'package:sib_attendance/views/dashborad_views.dart';
import 'package:sib_attendance/widget/custom_text.dart';
import 'package:sib_attendance/widget/drawer_widget.dart';
import 'package:sib_attendance/widget/live_card.dart';

class LiveViews extends StatefulWidget {
  const LiveViews({super.key});

  @override
  State<LiveViews> createState() => _LiveViewsState();
}

class _LiveViewsState extends State<LiveViews> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<LiveProvider>().fetchLive();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
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
        title: CustomText(text: "Live Screen", size: 14),
        backgroundColor: const Color(0xFF1B2B4A),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DashboradViews(),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await context.read<LiveProvider>().fetchLive();
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
          ),
        ],
      ),
    );
  }
}
