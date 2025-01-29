import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';
import 'package:frutes_app/core/theme/text_theme.dart';

import '../../../../../core/theme/colors_theme.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({super.key, required this.product});
  final ProductsEntity product;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 9.w,
      children: [
        const Icon(
          Icons.star,
          color: AppColors.orange400,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
            text: product.productRating.toString(),
            style: AppTextStyles.bodySmallSemiBold13,
          ),
          const TextSpan(
            text: ' \t ',
          ),
          TextSpan(
            text: '(${product.ratingCount.toString()})',
            style: AppTextStyles.bodySmallRegular13,
          ),
          const TextSpan(
            text: ' \t ',
          ),
          const TextSpan(
            text: ' \t ',
          ),
          TextSpan(
            text: 'المراجعة',
            style: AppTextStyles.bodySmallBold13.copyWith(
                color: AppColors.green1_500,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.green1_500,
                decorationThickness: 2),
          )
        ]))
      ],
    );
  }
}
