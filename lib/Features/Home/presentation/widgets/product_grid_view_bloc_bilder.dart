import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubit/products_cubit.dart';
import '../../../../core/errors/error_widget.dart';
import '../../../../core/functions/get_dummy_products.dart';
import 'products_grid_view.dart';

class ProductsGridViewBolcBilder extends StatelessWidget {
  const ProductsGridViewBolcBilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsGridView(
            products: state.products,
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
              child: CustomErrorWidget(text: state.errMessage));
        } else {
          return ProductsGridView(
            products: getDummyProducts(),
          );
        }
      },
    );
  }
}
