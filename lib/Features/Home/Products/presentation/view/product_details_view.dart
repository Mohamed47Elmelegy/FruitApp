import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/Repos/add_proudcuts/products_repo.dart';
import '../../../../../core/cubit/products_cubit.dart';
import '../../../../../core/entities/proudcuts_entity.dart';
import '../../../../../core/services/get_it_services.dart';
import '../widgets/product_info/product_details_view_body.dart';

class ProductsDeatalisView extends StatelessWidget {
  const ProductsDeatalisView({super.key, required this.product});
  final ProductsEntity product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => ProductsCubit(
          getIt.get<ProductsRepo>(),
        ),
        child: ProductDetailsViewBody(product: product),
      ),
    );
  }
}
