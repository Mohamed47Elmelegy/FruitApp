import 'package:frutes_app/core/constants/sort_options.dart';

class SortManager {
  static SortOption getDefaultSortOption() {
    return SortOption.priceLowToHigh;
  }

  static List<SortOption> getAllSortOptions() {
    return SortOption.values;
  }
}
