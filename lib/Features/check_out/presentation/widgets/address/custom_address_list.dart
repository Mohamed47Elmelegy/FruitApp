import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/Features/check_out/data/models/address_model.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';
import 'package:frutes_app/core/theme/text_theme.dart';

class AddressListWidget extends StatelessWidget {
  final List<AddressModel> addresses;
  final int? selectedIndex;
  final ValueChanged<int?> onSelect;
  final ValueChanged<int> onDelete;
  final ValueChanged<int> onEdit;
  final VoidCallback onAddNew;

  const AddressListWidget({
    super.key,
    required this.addresses,
    required this.selectedIndex,
    required this.onSelect,
    required this.onDelete,
    required this.onEdit,
    required this.onAddNew,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 12.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Instructions for user
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.green1_50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.green1_200),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: AppColors.green1_500,
                  size: 20.w,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    'اضغط مرتين على العنوان لاختياره',
                    style: AppTextStyles.bodyBaseRegular16.copyWith(
                      color: AppColors.green1_700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          ...List.generate(addresses.length, (index) {
            final address = addresses[index];
            final isSelected = selectedIndex == index;

            return GestureDetector(
              onDoubleTap: () {
                onSelect(isSelected ? null : index);
              },
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.green1_500
                        : Colors.grey.shade300,
                    width: isSelected ? 2 : 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                address.fullName,
                                style: AppTextStyles.bodyLargeBold19.copyWith(
                                  color: AppColors.grayscale900,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                address.email,
                                style: AppTextStyles.bodyBaseRegular16.copyWith(
                                  color: AppColors.grayscale600,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                address.address,
                                style: AppTextStyles.bodyBaseRegular16.copyWith(
                                  color: AppColors.grayscale700,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                '${address.city} - ${address.details}',
                                style: AppTextStyles.bodyBaseRegular16.copyWith(
                                  color: AppColors.grayscale600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isSelected)
                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: const BoxDecoration(
                              color: AppColors.green1_500,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 16.w,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => onEdit(index),
                          child: Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: Colors.blue.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.edit_outlined,
                              color: Colors.blue,
                              size: 18.w,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: () => onDelete(index),
                          child: Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: Colors.red.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                              size: 18.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
          SizedBox(height: 16.h),
        ],
      ).setAllPadding(context, 16.w, enableMediaQuery: false),
    );
  }
}
