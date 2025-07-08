import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/Features/Home/Cart/presentation/manager/cubits/Cart_item_cubit/cart_item_cubit.dart';
import 'package:frutes_app/core/config/constants.dart';
import 'package:frutes_app/core/widgets/butn.dart';
import 'package:frutes_app/main.dart';
import 'package:gap/gap.dart';
import '../../../../../core/routes/page_routes_name.dart';
import '../../../../../core/services/snack_bar_service.dart';
import '../../../../../core/theme/colors_theme.dart';
import '../../../../../core/theme/text_theme.dart';
import '../../../../../core/widgets/custom_header.dart';
import '../manager/cubits/Cart_cubit/cart_cubit.dart';
import 'cart_items_list.dart';
import 'package:frutes_app/core/services/app_settings_service.dart';

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
                              'لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سلة التسوق',
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
            CartItemsList(
              cartItems: context.read<CartCubit>().cartEntity.cartItems,
            ),
          ],
        ),
        Positioned(
          bottom: Constants.mediaQuery.height * 0.05,
          right: 0,
          left: 0,
          child: BlocBuilder<CartItemCubit, CartItemState>(
            builder: (context, state) {
              return Butn(
                text:
                    '${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه',
                color: AppColors.green1_500,
                onPressed: () async {
                  final cartCubit = context.read<CartCubit>();
                  final settings = await AppSettingsService.fetchAppSettings();
                  final minOrder =
                      settings.minOrderAmount > 0 ? settings.minOrderAmount : 1;
                  final total = cartCubit.cartEntity.calculateTotalPrice();
                  if (cartCubit.cartEntity.cartItems.isEmpty) {
                    SnackBarService.showErrorMessage('لا يوجد منتجات في السلة');
                  } else if (total < minOrder) {
                    SnackBarService.showErrorMessage(
                        'الحد الأدنى للطلب هو $minOrder جنيه');
                  } else {
                    navigatorKey.currentState
                        ?.pushNamed(PageRoutesName.checkoutView);
                  }
                },
              );
            },
          ),
        )
      ],
    );
  }
}
