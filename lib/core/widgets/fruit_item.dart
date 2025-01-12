import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import 'package:gap/gap.dart';
import '../theme/colors_theme.dart';
import '../theme/text_theme.dart';
import '../utils/app_images.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: AppColors.grayscale50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
                iconSize: 16.w,
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                )),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const Gap(20),
                SizedBox(
                    width: 114.w,
                    height: 105.h,
                    child: Image.asset(Assets.imagesStrawberryPng)),
                const Gap(24),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        spacing: 4.h,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'فراولة',
                            textAlign: TextAlign.right,
                            style: AppTextStyles.bodyBaseSemiBold13,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            spacing: 2.w,
                            children: [
                              Text(
                                '100',
                                style: AppTextStyles.bodyBaseSemiBold13
                                    .copyWith(color: AppColors.orange500),
                              ),
                              Text(
                                'جنية',
                                style: AppTextStyles.bodyBaseSemiBold13
                                    .copyWith(color: AppColors.orange500),
                              ),
                              Text(
                                '/',
                                style: AppTextStyles.bodyBaseSemiBold13
                                    .copyWith(color: AppColors.orange500),
                              ),
                              Text(
                                'كيلو',
                                style: AppTextStyles.bodyBaseSemiBold13
                                    .copyWith(color: AppColors.orange300),
                              ),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          maxRadius: 19.w,
                          backgroundColor: AppColors.green1_500,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).setHorizontalPadding(
              context,
              8.5.w,
              enableMediaQuery: false,
            ),
          ),
        ],
      ),
    );
  }
}
