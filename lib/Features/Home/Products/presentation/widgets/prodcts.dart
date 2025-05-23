import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import '../../../../../core/entities/proudcuts_entity.dart';
import '../../../../../core/theme/colors_theme.dart';
import '../../../../../core/widgets/netwark_image.dart';

class ProdctsItems extends StatelessWidget {
  const ProdctsItems({
    super.key,
    required this.products,
  });
  final ProductsEntity products;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 7,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(50.r),
          ),
          child: Container(
            height: 64.h,
            width: 64.w,
            decoration: ShapeDecoration(
              shadows: const [
                BoxShadow(
                  color: AppColors.antiFlashWhite,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                ),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  50.r,
                ),
              ),
            ),
            child: products.imageUrl != null
                ? CustomNetworkImage(products: products)
                : Container(
                    width: 50.h,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.grayscale50,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  ),
          ),
        ).setAllPadding(context, 7, enableMediaQuery: false),
        Text(products.productName),
      ],
    );
  }
}
