import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/config/constants.dart';
import '../../../../../core/entities/proudcuts_entity.dart';
import 'prodcts.dart';

class ProductItemsListView extends StatelessWidget {
  const ProductItemsListView({super.key, required this.products});
  final List<ProductsEntity> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constants.mediaQuery.height * 0.15.h,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: products.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ProdctsItems(
              products: products[index],
            ),
          );
        },
      ),
    );
  }
}
