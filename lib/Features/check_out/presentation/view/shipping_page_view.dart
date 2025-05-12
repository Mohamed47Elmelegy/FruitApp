import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/colors_theme.dart';
import '../../../../core/theme/text_theme.dart';

class ShippingPageView extends StatefulWidget {
  const ShippingPageView({super.key});

  @override
  State<ShippingPageView> createState() => _ShippingPageViewState();
}

class _ShippingPageViewState extends State<ShippingPageView> {
  int selectedPaymentMethod = 0; // 0 for cash, 1 for card

  @override
  Widget build(BuildContext context) {
    return _buildShippingPage();
  }

  Widget _buildShippingPage() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              _buildPaymentMethodItem(
                isSelected: selectedPaymentMethod == 0,
                index: 0,
                icon: Icons.payments_outlined,
                title: 'الدفع عند الاستلام',
                amount: '100 جنيه',
              ),
              Gap(16.h),
              _buildPaymentMethodItem(
                isSelected: selectedPaymentMethod == 1,
                index: 1,
                icon: Icons.credit_card,
                title: 'اشتري الآن وادفع لاحقاً',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodItem({
    required bool isSelected,
    required int index,
    required IconData icon,
    required String title,
    String? amount,
  }) {
    return AnimatedContainer(
      width: 343.w,
      height: 81.h,
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? AppColors.green1_500 : Colors.transparent,
        ),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(12.r),
          right: Radius.circular(12.r),
        ),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedPaymentMethod = index;
          });
        },
        child: Row(
          children: [
            _buildRadioButton(isSelected),
            Gap(12.w),
            Icon(
              icon,
              color: AppColors.grayscale900,
              size: 24.w,
            ),
            Gap(12.w),
            Text(
              title,
              style: AppTextStyles.bodyBaseBold16.copyWith(
                color: AppColors.grayscale900,
              ),
            ),
            if (amount != null) ...[
              const Spacer(),
              Text(
                amount,
                style: AppTextStyles.bodyBaseBold16.copyWith(
                  color: AppColors.grayscale900,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildRadioButton(bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 24.w,
      height: 24.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColors.grayscale50 : AppColors.grayscale400,
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 12.w,
                height: 12.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.green1_500,
                ),
              ),
            )
          : null,
    );
  }
}
