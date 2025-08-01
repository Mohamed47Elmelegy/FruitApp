import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/core/widgets/butn.dart';
import 'package:frutes_app/core/widgets/netwark_image.dart';
import 'package:gap/gap.dart';
import '../../../../Cart/presentation/manager/cubits/Cart_cubit/cart_cubit.dart';
import '/../Features/Home/Products/presentation/widgets/rating_row.dart';
import '/../core/config/constants.dart';
import '/../core/entities/proudcuts_entity.dart';
import '/../core/extensions/padding_ext.dart';
import '/../core/theme/text_theme.dart';
import '../../../../../../core/theme/colors_theme.dart';
import '../bottom_circle_clipper.dart';
import 'product_discriptions.dart';
import 'product_info_grid_view.dart';
import 'package:frutes_app/core/model/Products/product_model.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({
    super.key,
    required this.product,
  });
  final ProductsEntity product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: BottomCircleClipper(),
                child: Container(
                  height: Constants.mediaQuery.height * 0.4,
                  width: double.infinity,
                  color: AppColors.antiFlashWhite,
                  child: Center(
                    child: CustomNetworkImage(
                      products: product,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 30.h,
                right: 20.w,
                child: GestureDetector(
                    child: Container(
                      width: 44.w,
                      height: 44.h,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0A000000),
                            blurRadius: 9,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          )
                        ],
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    }),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.productName,
                            style: AppTextStyles.bodyBaseBold16,
                          ),
                          const Gap(8),
                          Row(
                            children: [
                              Text(
                                '${product.productPrice.toString()} جنية',
                                style: AppTextStyles.bodySmallBold13
                                    .copyWith(color: AppColors.orange500),
                              ),
                              Text(
                                '/',
                                style: AppTextStyles.bodySmallBold13.copyWith(
                                  color: AppColors.orange300,
                                ),
                              ),
                              Text(
                                'الكيلو',
                                style: AppTextStyles.bodySmallBold13.copyWith(
                                  color: AppColors.orange300,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      //  const AddRemoveItem(cartItemEntity: '',),
                    ],
                  ),
                  const Gap(8),
                  RatingRow(
                    product: product,
                  ),
                  const Gap(8),
                  ProductDescription(product: product),
                  const Gap(16),
                  ProductInfoGridView(product: product),
                  const Gap(24),
                  Butn(
                      text: 'أضف الي السلة',
                      color: AppColors.green1_500,
                      onPressed: () async {
                        final cartCubit = context.read<CartCubit>();
                        final error = await cartCubit
                            .addToCart(ProductModel.fromEntity(product));
                        if (error != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error)),
                          );
                        }
                      }),
                ],
              ).setHorizontalPadding(context, 20, enableMediaQuery: false),
            ),
          ),
        ],
      ),
    );
  }
}
