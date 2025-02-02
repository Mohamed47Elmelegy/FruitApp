import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/core/config/constants.dart';
import 'package:frutes_app/core/widgets/butn.dart';
import 'package:gap/gap.dart';
import '../../../../../core/theme/colors_theme.dart';
import '../../../../../core/theme/text_theme.dart';
import '../../../../../core/widgets/custom_header.dart';
import '../../domain/cart_item_entity.dart';
import 'cart_items_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  headerAppBar(context,
                      title: 'السلة',
                      arrowOnTap: () {},
                      notificationVisible: false,
                      arrowVisible: true),
                  const Gap(16),
                  Column(
                    children: [
                      Container(
                        height: 41.h,
                        width: double.infinity,
                        color: AppColors.green1_50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'لديك 4 منتجات في سلة التسوق',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.bodySmallRegular13
                                  .copyWith(color: AppColors.green1_500),
                            ),
                          ],
                        ),
                      ),
                      const Gap(24),
                    ],
                  ),
                ],
              ),
            ),
            const CartItemsList(
              cartItems: [],
            ),
          ],
        ),
        Positioned(
          bottom: Constants.mediaQuery.height * 0.05,
          right: 0,
          left: 0,
          child: Butn(
            text: 'جنيه',
            color: AppColors.green1_500,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
