import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/cubit/products_cubit.dart';
import '../../../../../core/errors/error_widget.dart';
import '../../../../../core/functions/get_dummy_products.dart';
import '../../../../../core/theme/colors_theme.dart';
import 'product_item_list_view.dart';

class ProductListViewBlocBuilder extends StatelessWidget {
  const ProductListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductItemsListView(
            products: state.products,
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
              child: CustomErrorWidget(text: state.errMessage));
        } else {
          return Skeletonizer.zone(
            containersColor: AppColors.grayscale50,
            enabled: true,
            child: ProductItemsListView(
              products: getDummyProducts(),
            ),
          );
        }
      },
    );
  }
}
