import 'package:flutter/material.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';
import 'package:frutes_app/core/theme/text_theme.dart';
import 'package:frutes_app/core/widgets/butn.dart';
import 'package:gap/gap.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  int selectedRadioValue = 0; // State for the selected radio button

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
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedRadioValue = 0;
                      });
                    },
                    child: Row(
                      children: [
                        Radio(
                          autofocus: true,
                          value: 0,
                          groupValue: selectedRadioValue,
                          onChanged: (value) {
                            setState(() {
                              selectedRadioValue = value!;
                            });
                          },
                        ),
                        const Text(
                          'السعر ( الأقل الي الأعلي )',
                          style: AppTextStyles.bodySmallBold13,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedRadioValue = 1;
                      });
                    },
                    child: Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: selectedRadioValue,
                          onChanged: (value) {
                            setState(() {
                              selectedRadioValue = value!;
                            });
                          },
                        ),
                        const Text(
                          'السعر ( الأعلي الي الأقل )',
                          style: AppTextStyles.bodySmallBold13,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedRadioValue = 2;
                      });
                    },
                    child: Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: selectedRadioValue,
                          onChanged: (value) {
                            setState(() {
                              selectedRadioValue = value!;
                            });
                          },
                        ),
                        const Text(
                          'الأبجديه',
                          style: AppTextStyles.bodySmallBold13,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Gap(20),
          Butn(
            onPressed: () {
              Navigator.pop(context); // Close the bottom sheet
            },
            color: AppColors.green1_500,
            text: 'تصفية',
          ),
        ],
      ),
    );
  }
}
