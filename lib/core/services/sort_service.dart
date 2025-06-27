import 'package:frutes_app/core/constants/sort_options.dart';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';

class SortService {
  static List<ProductsEntity> sortProducts(
    List<ProductsEntity> products,
    SortOption sortOption,
  ) {
    final sortedProducts = List<ProductsEntity>.from(products);

    switch (sortOption) {
      case SortOption.priceLowToHigh:
        sortedProducts.sort((a, b) => a.productPrice.compareTo(b.productPrice));
        break;
      case SortOption.priceHighToLow:
        sortedProducts.sort((a, b) => b.productPrice.compareTo(a.productPrice));
        break;
      case SortOption.alphabetical:
        sortedProducts.sort((a, b) => a.productName.compareTo(b.productName));
        break;
    }

    return sortedProducts;
  }
}
