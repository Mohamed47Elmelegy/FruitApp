import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/Features/Home/Cart/presentation/manager/cubits/Cart_cubit/cart_cubit.dart';

import '../../../../../../core/services/snack_bar_service.dart';
import 'product_details_view_body.dart';

class ProductsDetailsBlocConsumer extends StatelessWidget {
  const ProductsDetailsBlocConsumer({
    super.key,
    required this.currentViewIndex,
    required this.product,
  });

  final int currentViewIndex;
  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is AddItemToCart) {
          SnackBarService.showSuccessMessage('تم اضافة المنتج بنجاح');
        }
      },
      child: ProductDetailsViewBody(product: product),
    );
  }
}
