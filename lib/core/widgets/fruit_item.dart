import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import 'package:frutes_app/core/widgets/netwark_image.dart';
import 'package:gap/gap.dart';
import '../config/constants.dart';
import '../theme/colors_theme.dart';
import '../theme/text_theme.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.products});
  final ProductsEntity products;
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
          Positioned.fill(
            child: Column(
              children: [
                const Gap(5),
                SizedBox(
                  height: Constants.mediaQuery.height * 0.2,
                  width: double.infinity,
                  child: products.imageUrl != null
                      ? CusomtNetwarkImage(products: products)
                      : Container(
                          width: 50.h,
                          height: 50.h,
                          color: AppColors.grayscale50,
                        ),
                ),
                const Gap(7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        spacing: 4.h,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products.productName,
                            textAlign: TextAlign.right,
                            style: AppTextStyles.bodyBaseSemiBold13,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            spacing: 2.w,
                            children: [
                              Text(
                                products.productPrice.toString(),
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
                        ]),
                    GestureDetector(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Container(
                          color: AppColors.green1_500,
                          width: 36.w,
                          height: 36.h,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ).setHorizontalPadding(
              context,
              8.5.w,
              enableMediaQuery: false,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
                iconSize: 20.w,
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                )),
          ),
        ],
      ),
    );
  }
}
