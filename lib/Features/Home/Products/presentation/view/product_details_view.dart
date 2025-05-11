import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/Features/Home/Cart/presentation/manager/cubits/Cart_cubit/cart_cubit.dart';
import '../../../../../core/entities/proudcuts_entity.dart';
import '../widgets/product_info/product_details_view_body.dart';

class ProductsDeatalisView extends StatelessWidget {
  const ProductsDeatalisView({super.key, required this.product});
  final ProductsEntity product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => CartCubit(
        ),
        child: ProductDetailsViewBody(product: product),
      ),
    );
  }
}
