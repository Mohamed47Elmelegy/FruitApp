import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/Features/Home/Cart/domain/cart_item_entity.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';

import '../../Cart/presentation/manager/cubit/cart_cubit.dart';

class AddRemoveItem extends StatelessWidget {
  const AddRemoveItem({
    super.key,
    required this.cartItemEntity,
  });
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: GestureDetector(
            onTap: () {
              cartItemEntity.increaseItemCount();
            },
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: ShapeDecoration(
                color: AppColors.green1_500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 16.sp,
                ),
              ),
            ),
          ),
        ),
        Text(
          cartItemEntity.totalUnitAmount().toString(),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: GestureDetector(
            onTap: () {
              cartItemEntity.decreaseItemCount();
            },
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: ShapeDecoration(
                color: AppColors.antiFlashWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.remove,
                  color: AppColors.grayscale300,
                  size: 16.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
