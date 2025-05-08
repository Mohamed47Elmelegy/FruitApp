import 'package:equatable/equatable.dart';
import 'reviews_entity.dart';

class ProductsEntity extends Equatable {
  final String productName;
  final num productPrice;
  final String productCode;
  final String productDescription;
  final bool isFeatured;
  String? imageUrl;
  final int expiryDateMonths;
  final int calorieDensity;
  final int unitAmount;
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
    required this.unitAmount,
    this.productRating = 0,
    this.ratingCount = 0,
    this.isOrganic = false,
    required this.reviews,
  });

  @override
  List<Object?> get props => [productCode];
}
