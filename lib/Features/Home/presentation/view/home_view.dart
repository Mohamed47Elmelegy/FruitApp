import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import '../../../../core/Repos/add_proudcuts/products_repo.dart';
import '../../../../core/cubit/products_cubit.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
      child: const HomeViewBody(),
    );
  }
}
