import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/colors_theme.dart';
import '../../../../core/widgets/butn.dart';

class CheckoutPageBase extends StatelessWidget {
  const CheckoutPageBase({
    super.key,
    required this.child,
    required this.onNext,
    this.isLastStep = false,
  });

  final Widget child;
  final VoidCallback onNext;
  final bool isLastStep;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: child),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Butn(
            text: isLastStep ? 'تأكيد الطلب' : 'التالي',
            onPressed: onNext,
            color: AppColors.green1_500,
          ),
        ),
        Gap(16.h),
      ],
    );
  }
}
