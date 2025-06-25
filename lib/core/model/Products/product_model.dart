import 'package:frutes_app/core/entities/proudcuts_entity.dart';
import '../../functions/avg_rating.dart';
import 'reviews_model.dart';
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 2)
class ProductModel {
  @HiveField(0)
  final String productName;
  @HiveField(1)
  final num productPrice;
  @HiveField(2)
  final String productCode;
  @HiveField(3)
  final String productDescription;
  @HiveField(4)
  final bool isFeatured;
  @HiveField(5)
  String? imageUrl;
  @HiveField(6)
  final int expiryDateMonths;
  @HiveField(7)
  final int calorieDensity;
  @HiveField(8)
  final int unitAmount;
  @HiveField(9)
  final num productRating;
  @HiveField(10)
  final num ratingCount;
  @HiveField(11)
  final bool isOrganic;
  @HiveField(12)
  final List<ReviewsModel> reviews;
  @HiveField(13)
  final num sellingCount;
  ProductModel({
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
    this.sellingCount = 0,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['productName'],
      productPrice: json['productPrice'],
      productCode: json['productCode'],
      productDescription: json['productDescription'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      expiryDateMonths: json['expiryDateMonths'],
      calorieDensity: json['calories'],
      unitAmount: json['unitAmount'],
      productRating: getAvgRating(json['reviews'] != null
          ? List<ReviewsModel>.from(
              json['reviews'].map((e) => ReviewsModel.fromJson(e)))
          : []),
      ratingCount: json['ratingCount'],
      isOrganic: json['isOrganic'],
      reviews: json['reviews'] != null
          ? List<ReviewsModel>.from(
              (json['reviews'] as List).map((e) => ReviewsModel.fromJson(e)))
          : [],
      sellingCount: json['sellingCount'],
    );
  }

  factory ProductModel.fromEntity(ProductsEntity entity) {
    return ProductModel(
      productName: entity.productName,
      productPrice: entity.productPrice,
      productCode: entity.productCode,
      productDescription: entity.productDescription,
      isFeatured: entity.isFeatured,
      imageUrl: entity.imageUrl,
      expiryDateMonths: entity.expiryDateMonths,
      calorieDensity: entity.calorieDensity,
      unitAmount: entity.unitAmount,
      productRating: entity.productRating,
      ratingCount: entity.ratingCount,
      isOrganic: entity.isOrganic,
      reviews: entity.reviews.map((e) => ReviewsModel.fromEntity(e)).toList(),
      sellingCount: 0, // or any default value
    );
  }

  ProductsEntity toEntity() {
    return ProductsEntity(
      productName: productName,
      productPrice: productPrice,
      productCode: productCode,
      productDescription: productDescription,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      expiryDateMonths: expiryDateMonths,
      calorieDensity: calorieDensity,
      unitAmount: unitAmount,
      productRating: productRating,
      ratingCount: ratingCount,
      isOrganic: isOrganic,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  toJson() {
    return {
      'productName': productName,
      'productPrice': productPrice,
      'productCode': productCode,
      'sellingCount': sellingCount,
      'productDescription': productDescription,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expiryDateMonths': expiryDateMonths,
      'calories': calorieDensity,
      'unitAmount': unitAmount,
      'productRating': productRating,
      'ratingCount': ratingCount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModel &&
          runtimeType == other.runtimeType &&
          productCode == other.productCode;

  @override
  int get hashCode => productCode.hashCode;
}
