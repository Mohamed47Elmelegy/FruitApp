import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/Features/Home/Cart/domain/cart_item_entity.dart';
import 'package:frutes_app/Features/Home/Cart/presentation/widget/cart_item.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';

class AddRemoveItem extends StatelessWidget {
  const AddRemoveItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.r),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 36.h,
                width: 36.w,
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
          const Flexible(
            flex: 1,
            child: Text(
              "1",
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50.r),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 36.h,
                width: 36.w,
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
      ),
    );
  }
}
