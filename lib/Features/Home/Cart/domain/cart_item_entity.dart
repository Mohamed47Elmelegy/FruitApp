// هذا الكلاس يمثل عنصر في السلة
// يحتوي على ProductsEntity وعدد هذا المنتج في السلة
// يتم حساب المجموع الكلي لوحدة القياس والسعر الكلي للعنصر حسب العدد
import 'package:equatable/equatable.dart';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';
import 'package:hive/hive.dart';
import 'package:frutes_app/core/model/Products/product_model.dart';
part 'cart_item_entity.g.dart';

@HiveType(typeId: 3)
class CartItemEntity extends Equatable {
  @HiveField(0)
  final ProductModel productModel;
  @HiveField(1)
  int count;
  CartItemEntity({
    required this.productModel,
    this.count = 0,
  });

  /// يحسب المجموع الكلي لوحدة القياس
  /// من خلال ضرب وحدة القياس للمنتج مع العدد
  num totalUnitAmount() {
    return productModel.unitAmount * count;
  }

  /// يحسب السعر الكلي للعنصر
  /// من خلال ضرب سعر المنتج مع العدد
  num totalPrice() {
    return productModel.productPrice * count;
  }

  /// يزيد العدد ب 1
  void increaseItemCount() {
    count++;
  }

  /// يقلص العدد ب 1
  void decreaseItemCount() {
    if (count > 0) count--;
  }

  @override
  List<Object?> get props => [productModel];
}
