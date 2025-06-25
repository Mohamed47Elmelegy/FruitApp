import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';
import 'package:frutes_app/core/widgets/netwark_image.dart';
import 'package:frutes_app/main.dart';
import 'package:gap/gap.dart';
import '../../Features/Home/Cart/presentation/manager/cubits/Cart_cubit/cart_cubit.dart';
import '../config/constants.dart';
import '../routes/page_routes_name.dart';
import '../theme/colors_theme.dart';
import '../theme/text_theme.dart';
import 'package:frutes_app/core/model/Products/product_model.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.products});
  final ProductsEntity products;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigatorKey.currentState!.pushNamed(
          PageRoutesName.productDetails,
          arguments: products,
        );
      },
      child: Container(
        decoration: ShapeDecoration(
          color: AppColors.grayscale50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Gap(5),
                  SizedBox(
                    height: Constants.mediaQuery.height * 0.15.h,
                    width: double.infinity,
                    child: products.imageUrl != null
                        ? CustomNetworkImage(products: products)
                        : Container(
                            width: 50.h,
                            height: 50.h,
                            color: AppColors.grayscale50,
                          ),
                  ),
                  const Gap(5),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products.productName,
                                  textAlign: TextAlign.right,
                                  style: AppTextStyles.bodyBaseSemiBold13,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const Gap(2),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
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
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CartCubit>()
                                .addToCart(ProductModel.fromEntity(products));
                          },
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
                  ),
                ],
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
      ),
    );
  }
}
