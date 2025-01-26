import 'reviews_entity.dart';

class ProductsEntity {
  final String productName;
  final num productPrice;
  final String productCode;
  final String productDescription;
  final bool isFeatured;
  String? imageUrl;
  final int expiryDateMonths;
  final int calorieDensity;
  final int caloriesReferenceWeight;
  final num productRating;
  final num ratingCount;
  final bool isOrganic;
  final List<ReviewsEntity> reviews;
  ProductsEntity({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.productDescription,
    this.isFeatured = false,
    this.imageUrl,
    required this.expiryDateMonths,
    required this.calorieDensity,
    required this.caloriesReferenceWeight,
    this.productRating = 0,
    this.ratingCount = 0,
    this.isOrganic = false,
    required this.reviews,
  });
}
