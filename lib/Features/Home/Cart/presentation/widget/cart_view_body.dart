import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/Features/Home/Cart/presentation/widget/cart_item.dart';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';
import 'package:gap/gap.dart';
import '../../../../../core/theme/colors_theme.dart';
import '../../../../../core/theme/text_theme.dart';
import '../../../../../core/widgets/custom_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key, required this.products});
  final ProductsEntity products;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        headerAppBar(context,
            title: 'السلة',
            arrowOnTap: () {},
            notificationVisible: false,
            arrowVisible: true),
        const Gap(16),
        SingleChildScrollView(
          child: Column(
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
              CartItem(products: products),
              const Gap(16),
              SizedBox(
                width: double.infinity,
                height: 54.h,
                child: FloatingActionButton(
                  isExtended: true,
                  onPressed: () {},
                  backgroundColor: AppColors.green1_500,
                  child: Center(
                    child: Text(
                      '140 جنية',
                      style: AppTextStyles.bodyBaseBold16
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
