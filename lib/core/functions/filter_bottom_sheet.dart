// Function to show the filter bottom sheet
import 'package:flutter/material.dart';

import '../../Features/Home/Products/presentation/widgets/filter_bottom_Sheet.dart';

void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    sheetAnimationStyle: AnimationStyle(
      duration: const Duration(milliseconds: 600),
      reverseDuration: const Duration(milliseconds: 350),
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
      return const FilterBottomSheet(); // Use the FilterBottomSheet widget
    },
  );
}
