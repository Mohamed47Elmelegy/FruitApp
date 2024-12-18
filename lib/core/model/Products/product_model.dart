import 'dart:io';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';

import 'reviews_model.dart';

class ProductModel {
  final String productName;
  final num productPrice;
  final String productCode;
  final String productDescription;
  final File productImage;
  final bool isFeatured;
  String? imageUrl;
  final int expiryDateMonths;
  final int calorieDensity;
  final int caloriesReferenceWeight;
  final num productRating;
  final num ratingCount;
  final bool isOrganic;
  final List<ReviewsModel> reviews;
  final num sellingCount;
  ProductModel({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.productDescription,
    required this.productImage,
    this.isFeatured = false,
    this.imageUrl,
    required this.expiryDateMonths,
    required this.calorieDensity,
    required this.caloriesReferenceWeight,
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
      caloriesReferenceWeight: json['caloriesPerServing'],
      productRating: json['productRating'],
      ratingCount: json['ratingCount'],
      isOrganic: json['isOrganic'],
      productImage: json['productImage'],
      reviews: json['reviews'].map((e) => ReviewsModel.fromJson(e)).toList(),
      sellingCount: json['sellingCount'],
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
      caloriesReferenceWeight: caloriesReferenceWeight,
      productRating: productRating,
      ratingCount: ratingCount,
      isOrganic: isOrganic,
      productImage: productImage,
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
      'caloriesPerServing': caloriesReferenceWeight,
      'productRating': productRating,
      'ratingCount': ratingCount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
