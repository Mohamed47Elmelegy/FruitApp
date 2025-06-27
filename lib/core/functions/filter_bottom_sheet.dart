// Function to show the filter bottom sheet
import 'package:flutter/material.dart';
import 'package:frutes_app/core/cubit/products_cubit.dart';

import '../../Features/Home/Products/presentation/widgets/filter_bottom_Sheet.dart';

void showFilterBottomSheet(BuildContext context, ProductsCubit productsCubit) {
  showModalBottomSheet<void>(
    sheetAnimationStyle: const AnimationStyle(
      duration: Duration(milliseconds: 600),
      reverseDuration: Duration(milliseconds: 350),
    ),

    // transitionAnimationController: AnimationController(
    //   vsync: Navigator.of(context),
    //   duration: const Duration(milliseconds: 600),
    // ),
    useSafeArea: true,
    showDragHandle: true,
    elevation: 5, // Add elevation to the bottom sheet
    context: context,
    isScrollControlled: true, // Allow the bottom sheet to take full height
    builder: (BuildContext context) {
      return FilterBottomSheet(
          productsCubit: productsCubit); // Pass the ProductsCubit
    },
  );
}
