import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Repos/add_proudcuts/products_repo.dart';
import '../../../../../core/cubit/products_cubit.dart';
import '../../../../../core/services/get_it_services.dart';
import '../widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => ProductsCubit(
          getIt.get<ProductsRepo>(),
        ),
        child: const ProductsViewBody(),
      ),
    );
  }
}
