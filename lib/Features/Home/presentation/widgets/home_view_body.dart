import 'package:flutter/material.dart';
import 'package:frutes_app/Features/Home/presentation/widgets/discount_offers.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import 'package:frutes_app/core/widgets/search_text_field.dart';
import 'package:gap/gap.dart';
import '../../../../core/widgets/home_app_bar.dart';
import 'best_selling_header.dart';
import 'products_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
        ProductsGridView(),
      ],
    ).setHorizontalPadding(
      context,
      16,
      enableMediaQuery: false,
    );
  }
}
