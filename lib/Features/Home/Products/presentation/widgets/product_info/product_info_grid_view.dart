import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';

import '../../../../../../core/utils/app_images.dart';

class ProductInfoGridView extends StatelessWidget {
  const ProductInfoGridView({super.key, required this.product});
  final ProductsEntity product;
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الأعمدة
        childAspectRatio: 2, // نسبة العرض إلى الارتفاع
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      children: [
        _buildGridItem(Assets.imagesIsOrganic, product.isOrganic ? "100%" : '',
            product.isOrganic ? "أورجانيك" : "غير عضوي"),
        _buildGridItem(
            Assets.imagesCalendar, "${product.expiryDateMonths}", "الصلاحية"),
        _buildGridItem(Assets.imagesRating,
            "${product.productRating} (${product.ratingCount})", "التقييم"),
        _buildGridItem(Assets.imagesCalorie, "${product.calorieDensity} كالوري",
            "${100} جرام"),
      ],
    );
  }

  Widget _buildGridItem(String imagePath, String title, String subtitle) {
    return Container(
      width: 163.w,
      height: 80.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grayscale200),
          boxShadow: const [
            BoxShadow(
              color: AppColors.grayscale200,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ]),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                title.isNotEmpty
                    ? Text(
                        title,
                      )
                    : const SizedBox.shrink(),
                subtitle.isNotEmpty
                    ? Text(
                        subtitle,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          imagePath.endsWith('.svg')
              ? SvgPicture.asset(
                  imagePath,
                  width: 30,
                  height: 30,
                )
              : Image.asset(
                  imagePath,
                  width: 30,
                  height: 30,
                ),
        ],
      ),
    );
  }
}
