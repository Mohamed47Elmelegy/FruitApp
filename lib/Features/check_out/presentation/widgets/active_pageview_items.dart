import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';

import '../../../../core/theme/text_theme.dart';

class ActivePageViewItems extends StatelessWidget {
  const ActivePageViewItems(
      {super.key, required this.text, this.isCompleted = false});
  final String text;
  final bool isCompleted;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4.w,
      children: [
        SizedBox(
          width: 23.w,
          height: 23.h,
          child: CircleAvatar(
            backgroundColor: AppColors.green1_500,
            child: Icon(
              Icons.check,
              color: AppColors.grayscale50,
            ),
          ),
        ),
        Text(
          text,
          style: AppTextStyles.bodySmallBold13.copyWith(
            color: AppColors.green1_500,
          ),
        ),
      ],
    );
  }
}
