import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/colors_theme.dart';
import '../../../../core/theme/text_theme.dart';

class ActiveItems extends StatelessWidget {
  const ActiveItems({super.key, required this.text, required this.image});

  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        decoration: ShapeDecoration(
          color: const Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30.r,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30.w,
              height: 30.h,
              decoration: ShapeDecoration(
                color: const Color(0xFF1B5E37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: Center(child: SvgPicture.asset(image)),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              text,
              style: AppTextStyles.bodyXsmallSemibold11
                  .copyWith(color: AppColors.green1_500),
            )
          ],
        ),
      ),
    );
  }
}
