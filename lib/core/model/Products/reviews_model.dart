import 'package:frutes_app/core/entities/proudcuts_entity.dart';

import '../../entities/reviews_entity.dart';

class ReviewsModel {
  final String name;
  final String image;
  final num rating;
  final String date;
  final String description;

  ReviewsModel(
      {required this.name,
      required this.image,
      required this.rating,
      required this.date,
      required this.description});
  factory ReviewsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsModel(
        name: json['name'],
        image: json['image'],
        rating: json['rating'],
        date: json['date'],
        description: json['description']);
  }
  factory ReviewsModel.fromEntity(ReviewsEntity reviewsEntity) {
    return ReviewsModel(
        name: reviewsEntity.name,
        image: reviewsEntity.image,
        rating: reviewsEntity.rating,
        date: reviewsEntity.date,
        description: reviewsEntity.description);
  }
  ReviewsEntity toEntity() {
    return ReviewsEntity(
        name: name,
        image: image,
        rating: rating,
        date: date,
        description: description);
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'rating': rating,
      'date': date,
      'description': description
    };
  }
}
