import 'package:flutter/material.dart';
import 'package:sib_attendance/utils/app_colors.dart';
import 'package:sib_attendance/widget/custom_text.dart';
import 'package:sib_attendance/widget/dashborad_items.dart';

class DashboradViews extends StatelessWidget {
  DashboradViews({super.key});

  final List<DashboradItems> items = [
    DashboradItems(
      title: "Synced Devices",
      value: '2',
      icon: Icons.monitor,
      iconColor: AppColors.dashboardGreenIcon,
      gradient: AppColors.devicesGradient,
    ),
    DashboradItems(
      title: "Synced Logs",
      value: '34,802',
      icon: Icons.description,
      iconColor: AppColors.dashboardRedIcon,
      gradient: AppColors.logsGradient,
    ),
    DashboradItems(
      title: "Synced Employees",
      value: '77',
      icon: Icons.people,
      iconColor: AppColors.dashboardBlueIcon,
      gradient: AppColors.employeesGradient,
    ),
    DashboradItems(
      title: "Inside Company",
      value: '66',
      icon: Icons.file_download_outlined,
      iconColor: AppColors.dashboardGreenIcon,
      gradient: AppColors.insideCompanyGradient,
    ),
    DashboradItems(
      title: "Outside Company",
      value: '34',
      icon: Icons.file_upload_outlined,
      iconColor: AppColors.dashboardRedIcon,
      gradient: AppColors.outsideCompanyGradient,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText(text: "Dashboard", size: 14)),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: items.length,
        itemBuilder: (context, index) => items[index],
      ),
    );
  }
}
