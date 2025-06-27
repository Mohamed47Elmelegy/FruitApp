enum SortOption {
  priceLowToHigh, // السعر ( الأقل الي الأعلي )
  priceHighToLow, // السعر ( الأعلي الي الأقل )
  alphabetical, // الأبجديه
}

extension SortOptionExtension on SortOption {
  String get displayName {
    switch (this) {
      case SortOption.priceLowToHigh:
        return 'السعر ( الأقل الي الأعلي )';
      case SortOption.priceHighToLow:
        return 'السعر ( الأعلي الي الأقل )';
      case SortOption.alphabetical:
        return 'الأبجديه';
    }
  }
}
