import 'package:flutter/material.dart';
import 'package:sib_attendance/utils/app_colors.dart';
import 'package:sib_attendance/widget/custom_text.dart';

class DialogItmes extends StatefulWidget {
  const DialogItmes({super.key});

  @override
  State<DialogItmes> createState() => _DialogItmesState();
}

class _DialogItmesState extends State<DialogItmes> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 240,
              width: double.infinity,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    // backgroundImage: NetworkImage(
                    //   "https://tse2.mm.bing.net/th/id/OIP.FrBhKyfymwB1b8uIzgLuYwHaFp?rs=1&pid=ImgDetMain&o=7&rm=3",
                    // ),
                    child: Icon(
                      size: 50,
                      Icons.check_circle,
                      color: AppColors.presentText,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomText(text: "The synchronization is complete"),
                  SizedBox(height: 12),
                  SizedBox(
                    //width: double.infinity,
                    width: 100,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: CustomText(text: "close", size: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
