import 'package:flutter/material.dart';
import 'package:sib_attendance/utils/app_colors.dart';
import 'package:sib_attendance/widget/custom_text.dart';

class MothlyAttendanceItem extends StatelessWidget {
  const MothlyAttendanceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "17",
                          size: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                        CustomText(
                          text: "Nov",
                          size: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "ARRIVLE",
                        size: 12,
                        color: Colors.grey.shade600,
                      ),
                      CustomText(
                        text: "DEPARTURE",
                        size: 14,
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      CustomText(text: "08:00 AM", size: 14),
                      CustomText(text: "03:30 PM", size: 14),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: AppColors.presentIcon,
                          ),
                          CustomText(
                            text: "PRESENT",
                            size: 14,
                            color: AppColors.presentText,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
