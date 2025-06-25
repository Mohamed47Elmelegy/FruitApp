import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/services/snack_bar_service.dart';
import '../../../../Home/Cart/presentation/manager/cubits/Cart_cubit/cart_cubit.dart';
import '../../manager/address_cubit.dart';
import '../../../data/models/address_model.dart';
import '../../../../../../core/theme/colors_theme.dart';
import '../../../../../../core/theme/text_theme.dart';
import '../../../../../../core/widgets/butn.dart';
import '../../../../../../main.dart';
import '../../../../../../core/routes/page_routes_name.dart';
import '../../manager/order_cubit.dart';
import '../../../domain/entity/order_entity.dart';

class CustomConfirmOrderPage extends StatelessWidget {
  const CustomConfirmOrderPage(
      {super.key, this.onBack, this.selectedAddressIndex});

  final VoidCallback? onBack;
  final int? selectedAddressIndex;

  void _handleConfirmOrder(BuildContext context) async {
    final cart = context.read<CartCubit>().cartEntity;
    final subtotal = cart.calculateTotalPrice();
    const delivery = 30.0;
    final total = subtotal + delivery;
    final address = context.read<AddressCubit>().selectedAddress;
    final uid = FirebaseAuth.instance.currentUser?.uid ?? '';

    final order = OrderEntity(
      uid: uid,
      products: cart.cartItems
          .map((item) => {
                'productCode': item.productModel.productCode,
                'name': item.productModel.productName,
                'count': item.count,
                'price': item.productModel.productPrice,
              })
          .toList(),
      subtotal: subtotal,
      delivery: delivery,
      total: total,
      createdAt: DateTime.now().toIso8601String(),
      address: address != null
          ? {
              'fullName': address.fullName,
              'email': address.email,
              'address': address.address,
              'city': address.city,
              'details': address.details,
            }
          : null,
      status: 'pending',
    );
    context.read<OrderCubit>().saveOrder(order);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      listener: (context, state) async {
        if (state is OrderSuccess) {
          await context.read<CartCubit>().clearCart();
          SnackBarService.showSuccessMessage('تم تأكيد الطلب وحفظه بنجاح!');
          await Future.delayed(const Duration(seconds: 1));
          navigatorKey.currentState?.pushNamed(PageRoutesName.home);
        } else if (state is OrderFailure) {
          SnackBarService.showErrorMessage('حدث خطأ أثناء حفظ الطلب!');
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('ملخص الطلب',
                        style: AppTextStyles.bodyLargeBold19),
                    Gap(16.h),
                    // Order Summary
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        final cart = context.read<CartCubit>().cartEntity;
                        final subtotal = cart.calculateTotalPrice();
                        const delivery = 30.0; // ثابت كما في الصورة
                        final total = subtotal + delivery;
                        return Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: AppColors.grayscale50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('المجموع الفرعي:',
                                      style: AppTextStyles.bodyBaseRegular16),
                                  Text('${subtotal.toInt()} جنيه',
                                      style: AppTextStyles.bodyBaseBold16),
                                ],
                              ),
                              Gap(8.h),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('التوصيل:',
                                      style: AppTextStyles.bodyBaseRegular16),
                                  Text('30 جنيه',
                                      style: AppTextStyles.bodyBaseBold16),
                                ],
                              ),
                              Divider(
                                  height: 24.h,
                                  thickness: 1,
                                  color: AppColors.grayscale200),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('الكلي',
                                      style: AppTextStyles.bodyLargeBold19),
                                  Text('${total.toInt()} جنيه',
                                      style: AppTextStyles.bodyLargeBold19),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Gap(24.h),
                    const Text('يرجي تأكيد طلبك',
                        style: AppTextStyles.bodyBaseBold16),
                    Gap(16.h),
                    // Address Section
                    const Text('عنوان التوصيل',
                        style: AppTextStyles.bodyBaseBold16),
                    Gap(8.h),
                    BlocBuilder<AddressCubit, List<AddressModel>>(
                      builder: (context, addresses) {
                        final address =
                            context.read<AddressCubit>().selectedAddress;
                        if (addresses.isEmpty || address == null) {
                          return Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: AppColors.grayscale100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text('لم يتم اختيار عنوان بعد',
                                style: AppTextStyles.bodyBaseRegular16),
                          );
                        }
                        return Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: AppColors.grayscale50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on_outlined,
                                  color: AppColors.green1_500),
                              Gap(8.w),
                              Expanded(
                                child: Text(
                                  '${address.address}, ${address.details}',
                                  style: AppTextStyles.bodyBaseRegular16,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  if (onBack != null)
                    Expanded(
                      child: Butn(
                        text: 'رجوع',
                        onPressed: onBack!,
                        color: AppColors.grayscale400,
                      ),
                    ),
                  if (onBack != null) SizedBox(width: 12.w),
                  Expanded(
                    flex: 2,
                    child: Butn(
                      text: 'تأكيد الطلب',
                      color: AppColors.green1_500,
                      onPressed: () => _handleConfirmOrder(context),
                    ),
                  ),
                ],
              ),
            ),
            Gap(16.h),
          ],
        ),
      ),
    );
  }
}
