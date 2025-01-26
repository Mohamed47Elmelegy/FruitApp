import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubit/products_cubit.dart';
import '/Features/Home/presentation/widgets/discount_offers.dart';
import 'package:gap/gap.dart';
import '../../../../core/widgets/home_app_bar.dart';
import '../../../../core/widgets/search_text_field.dart';
import 'best_selling_header.dart';
import 'product_grid_view_bloc_bilder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomHomeAppBar(),
              Gap(16),
              SearchTextField(),
              Gap(16),
              DiscountOffersSection(),
              Gap(12),
              BestSellingHeader(),
              Gap(8),
            ],
          ),
        ),
        ProductsGridViewBolcBilder(),
      ],
    );
  }
}
