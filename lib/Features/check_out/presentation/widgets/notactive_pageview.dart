import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';

import '../../../../core/theme/text_theme.dart';

class NotActivePageView extends StatelessWidget {
  const NotActivePageView({super.key, required this.text, required this.index});
  final String text;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4.w,
      children: [
        SizedBox(
          width: 20.w,
          height: 20.h,
          child: CircleAvatar(
            backgroundColor: AppColors.grayscale50,
            child: Text(
              index.toString(),
              style: AppTextStyles.bodySmallSemiBold13.copyWith(
                color: AppColors.grayscale400,
              ),
            ),
          ),
        ),
        Text(
          text,
          style: AppTextStyles.bodySmallSemiBold13.copyWith(
            color: AppColors.grayscale400,
          ),
        ),
      ],
    );
  }
}
