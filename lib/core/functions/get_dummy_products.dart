
import 'package:frutes_app/core/entities/proudcuts_entity.dart';

ProductsEntity getDummyProduct() {
  return ProductsEntity(
    productName: 'Apple',
    productCode: '123',
    productDescription: 'Fresh apple',
    productPrice: 2.5,
    reviews: [],
    expiryDateMonths: 6,
    calorieDensity: 100,
    caloriesReferenceWeight: 1,
    isOrganic: true,
    isFeatured: true,
    imageUrl: null,
  );
}

List<ProductsEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
