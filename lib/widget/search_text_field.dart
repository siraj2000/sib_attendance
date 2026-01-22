import 'package:flutter/material.dart';
import 'package:sib_attendance/utils/app_colors.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const SearchTextField({
    super.key,
    this.hintText = 'Search',
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 254, 254),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.06),
              blurRadius: 14,
              spreadRadius: 0,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          cursorColor: AppColors.primary,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.withOpacity(.8),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Icon(
                Icons.search_rounded,
                color: AppColors.primary.withOpacity(.85),
                size: 22,
              ),
            ),
            suffixIcon: controller == null
                ? null
                : IconButton(
                    splashRadius: 18,
                    onPressed: () {
                      controller!.clear();
                      if (onChanged != null) {
                        onChanged!('');
                      }
                    },
                    icon: Icon(
                      Icons.close_rounded,
                      color: Colors.grey.withOpacity(.7),
                      size: 20,
                    ),
                  ),
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: AppColors.primary.withOpacity(.12),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: AppColors.primary.withOpacity(.12),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: AppColors.primary.withOpacity(.55),
                width: 1.6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
