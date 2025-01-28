import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:frutes_app/core/widgets/custom_header.dart';
import '../../../../../core/cubit/products_cubit.dart';
import '../../../../../core/functions/filter_bottom_sheet.dart';
import '../../../../../core/theme/text_theme.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/search_text_field.dart';
import '../../../presentation/widgets/product_grid_view_bloc_bilder.dart';
import 'product_items_list_view_bloc_builder.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts(); //get All products from cubit
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                //custom headerAppBar widget For Producs
                headerAppBar(context,
                    title: 'المنتجات',
                    arrowOnTap: () {},
                    notificationVisible: true,
                    arrowVisible: false),
                const Gap(16),
                //SearchTextField widget
                const SearchTextField(),
                const Gap(16),
                //Filter and products title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'منتجاتنا',
                      style: AppTextStyles.bodyBaseBold16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: GestureDetector(
                        onTap: () {
                          // Show the bottom sheet
                          showFilterBottomSheet(context);
                        },
                        child: SvgPicture.asset(
                          Assets.imagesFilter2,
                        ),
                      ),
                    )
                  ],
                ),
                const Gap(16),
              ],
            ),
          ),
          // Product List View - for horizontal scrolling
          const SliverToBoxAdapter(child: ProductListViewBlocBuilder()),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20.h,
            ),
          ),
          // Products Grid View - for vertical scrolling
          const ProductsGridViewBolcBilder(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 40.h,
            ),
          ),
        ],
      ),
    );
  }
}
