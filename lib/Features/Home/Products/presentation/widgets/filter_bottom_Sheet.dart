import 'package:flutter/material.dart';
import 'package:frutes_app/core/constants/sort_options.dart';
import 'package:frutes_app/core/cubit/products_cubit.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';
import 'package:frutes_app/core/theme/text_theme.dart';
import 'package:frutes_app/core/widgets/butn.dart';
import 'package:gap/gap.dart';
import '../manager/sort_manager.dart';
import 'sort_option_item.dart';

class FilterBottomSheet extends StatefulWidget {
  final ProductsCubit productsCubit;

  const FilterBottomSheet({
    super.key,
    required this.productsCubit,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  SortOption selectedSortOption = SortManager.getDefaultSortOption();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
            ),
          ),
          Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ترتيب حسب :',
                style: AppTextStyles.bodyLargeBold19,
              ).setHorizontalPadding(context, 16, enableMediaQuery: false),
              Column(
                children: SortManager.getAllSortOptions()
                    .map((sortOption) => SortOptionItem(
                          sortOption: sortOption,
                          selectedSortOption: selectedSortOption,
                          onSortOptionChanged: (option) {
                            setState(() {
                              selectedSortOption = option;
                            });
                          },
                        ))
                    .toList(),
              ),
            ],
          ),
          const Gap(20),
          Butn(
            onPressed: () {
              // Apply sorting and close bottom sheet
              widget.productsCubit.sortProducts(selectedSortOption);
              Navigator.pop(context);
            },
            color: AppColors.green1_500,
            text: 'تصفية',
          ),
        ],
      ),
    );
  }
}
