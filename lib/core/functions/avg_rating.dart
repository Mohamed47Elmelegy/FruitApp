import 'package:frutes_app/core/model/Products/reviews_model.dart';

num getAvgRating(List<ReviewsModel> reviews) {
  var sum = 0.0;
  for (var review in reviews) {
    sum += review.rating;
  }
  return sum / reviews.length;
}

