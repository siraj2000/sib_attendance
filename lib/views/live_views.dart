import 'package:flutter/material.dart';
import 'package:sib_attendance/widget/custom_text.dart';
import 'package:sib_attendance/widget/live_card.dart';

class LiveViews extends StatelessWidget {
  const LiveViews({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: CustomText(text: "Live Screen", size: 14)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Text(
              searchController.value.text.trim().isEmpty
                  ? "name"
                  : searchController.text,
            ),
            SizedBox(height: 10),

            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => LiveCard(),

              separatorBuilder: (context, index) => SizedBox(height: 6),
              itemCount: 10,
            ),
          ],
        ),
      ),
    );
  }
}
