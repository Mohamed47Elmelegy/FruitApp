import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/colors_theme.dart';

/// A custom animated radio button widget that can be used across the app.
///
/// This widget provides a consistent radio button design with animation support.
class CustomRadioButton extends StatelessWidget {
  /// Whether the radio button is selected
  final bool isSelected;

  /// The color of the selected radio button's inner circle
  final Color? selectedColor;

  /// The color of the radio button's border when selected
  final Color? selectedBorderColor;

  /// The color of the radio button's border when not selected
  final Color? unselectedBorderColor;

  /// The size of the radio button
  final double? size;

  /// The size of the inner circle when selected
  final double? innerCircleSize;

  const CustomRadioButton({
    super.key,
    required this.isSelected,
    this.selectedColor,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.size,
    this.innerCircleSize,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: size ?? 24.w,
      height: size ?? 24.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? selectedBorderColor ?? AppColors.grayscale50
              : unselectedBorderColor ?? AppColors.grayscale400,
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: innerCircleSize ?? 12.w,
                height: innerCircleSize ?? 12.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selectedColor ?? AppColors.green1_500,
                ),
              ),
            )
          : null,
    );
  }
}
