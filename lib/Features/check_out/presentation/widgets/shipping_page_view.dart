import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/colors_theme.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/widgets/custom_radio_button.dart';
import '../../../Home/Cart/presentation/manager/cubits/Cart_cubit/cart_cubit.dart';
import 'checkout_page_base.dart';

class ShippingPageView extends StatefulWidget {
  const ShippingPageView({
    super.key,
    required this.onNext,
  });

  final VoidCallback onNext;

  @override
  State<ShippingPageView> createState() => _ShippingPageViewState();
}

class _ShippingPageViewState extends State<ShippingPageView> {
  int selectedPaymentMethod = 0; // 0 for cash, 1 for card

  @override
  Widget build(BuildContext context) {
    return CheckoutPageBase(
      onNext: widget.onNext,
      child: _buildShippingPage(),
    );
  }

  Widget _buildShippingPage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          _buildPaymentMethodItem(
              isSelected: selectedPaymentMethod == 0,
              index: 0,
              icon: Icons.payments_outlined,
              title: 'الدفع عند الاستلام',
              amount:
                  '${context.read<CartCubit>().cartEntity.calculateTotalPrice().toInt()} جنيه'),
          Gap(16.h),
          _buildPaymentMethodItem(
            isSelected: selectedPaymentMethod == 1,
            index: 1,
            icon: Icons.credit_card,
            title: 'اشتري الآن وادفع لاحقاً',
          ),
        ],
      ),
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
            CustomRadioButton(isSelected: isSelected),
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
}
