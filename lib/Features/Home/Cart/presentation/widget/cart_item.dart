import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frutes_app/Features/Home/Cart/domain/cart_item_entity.dart';
import 'package:frutes_app/Features/Home/presentation/widgets/add_remove_item.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';
import 'package:frutes_app/core/utils/app_images.dart';
import 'package:frutes_app/core/widgets/netwark_image.dart';
import 'package:gap/gap.dart';
import '../../../../../core/config/constants.dart';
import '../../../../../core/theme/text_theme.dart';
import '../manager/cubits/Cart_cubit/cart_cubit.dart';
import '../manager/cubits/Cart_item_cubit/cart_item_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});
  final CartItemEntity cartItem;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (prev, currentState) {
        if (currentState is CartItemUpdated) {
          if (currentState.cartItemEntity == cartItem) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.grayscale200)),
            child: Row(
              children: [
                SizedBox(
                  width: 73.w,
                  child: CustomNetworkImage(products: cartItem.productModel.toEntity())
                      .setAllPadding(
                    context,
                    5,
                    enableMediaQuery: false,
                  ),
                ),
                const Gap(17),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            cartItem.productModel.productName,
                            style: AppTextStyles.bodySmallBold13,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              context
                                  .read<CartCubit>()
                                  .removeCartItem(cartItem);
                            },
                            icon: SvgPicture.asset(
                              Assets.imagesTrash,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${cartItem.totalUnitAmount()} كجم',
                        style: AppTextStyles.bodyBaseBold16.copyWith(
                          color: AppColors.orange500,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Constants.mediaQuery.width * 0.3.w,
                            height: 36.h,
                            child: AddRemoveItem(
                              cartItemEntity: cartItem,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${cartItem.totalPrice().toStringAsFixed(1)} جنيه',
                              style: AppTextStyles.bodyBaseBold16.copyWith(
                                color: AppColors.orange500,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
