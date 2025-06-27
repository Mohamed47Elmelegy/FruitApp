import 'package:flutter/material.dart';
import 'package:frutes_app/core/constants/sort_options.dart';
import 'package:frutes_app/core/theme/text_theme.dart';

class SortOptionItem extends StatelessWidget {
  final SortOption sortOption;
  final SortOption selectedSortOption;
  final ValueChanged<SortOption> onSortOptionChanged;

  const SortOptionItem({
    super.key,
    required this.sortOption,
    required this.selectedSortOption,
    required this.onSortOptionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSortOptionChanged(sortOption),
      child: Row(
        children: [
          Radio<SortOption>(
            value: sortOption,
            groupValue: selectedSortOption,
            onChanged: (value) {
              if (value != null) {
                onSortOptionChanged(value);
              }
            },
          ),
          Text(
            sortOption.displayName,
            style: AppTextStyles.bodySmallBold13,
          ),
        ],
      ),
    );
  }
}
