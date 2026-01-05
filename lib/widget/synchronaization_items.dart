import 'package:flutter/material.dart';
import 'package:sib_attendance/utils/app_colors.dart';
import 'package:sib_attendance/widget/custom_text.dart';

class SynchronaizationItems extends StatelessWidget {
  final String title;
  final String lastSync;
  final Function() onTap;
  final Color bgColor;

  final IconData icon;
  const SynchronaizationItems({
    super.key,
    required this.title,
    required this.lastSync,
    required this.onTap,
    required this.bgColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(icon, color: AppColors.primary),
                    ),
                    SizedBox(width: 10),
                    CustomText(
                      text: title,
                      size: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CustomText(
                      text: "Last Sync :",
                      size: 14,
                      color: Colors.grey.shade600,
                    ),
                    SizedBox(width: 10),
                    CustomText(
                      text: lastSync,
                      size: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: onTap,
                  child: Container(
                    width: double.infinity,
                    height: 46,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Icon(Icons.sync, color: Colors.white),
                        CustomText(
                          text: "Sync Now",
                          size: 14,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
