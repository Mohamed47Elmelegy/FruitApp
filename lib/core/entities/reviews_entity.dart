class ReviewsEntity {
  final String name;
  final String image;
  final num rating;
  final String date;
  final String description;

  ReviewsEntity(
      {required this.name,
      required this.image,
      required this.rating,
      required this.date,
      required this.description});
}
