import '../../entities/reviews_entity.dart';
import 'package:hive/hive.dart';

part 'reviews_model.g.dart';

@HiveType(typeId: 1)
class ReviewsModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final num rating;
  @HiveField(3)
  final String date;
  @HiveField(4)
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
