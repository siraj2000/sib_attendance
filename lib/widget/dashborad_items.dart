import 'package:flutter/material.dart';
import 'package:sib_attendance/widget/custom_text.dart';

class DashboradItems extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color? bgColor;
  final Gradient? gradient;

  const DashboradItems({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
    this.bgColor,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: gradient == null ? bgColor : null,
        gradient: gradient,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: title, size: 14),

              const SizedBox(height: 6),
              CustomText(text: value, size: 28, fontWeight: FontWeight.bold),
            ],
          ),
        ],
      ),
    );
  }
}
