// هذا الكلاس يمثل عنصر في السلة
// يحتوي على ProductsEntity وعدد هذا المنتج في السلة
// يتم حساب المجموع الكلي لوحدة القياس والسعر الكلي للعنصر حسب العدد
import 'package:equatable/equatable.dart';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';

class CartItemEntity extends Equatable {
  final ProductsEntity productsEntity;
  int count;
  CartItemEntity({
    required this.productsEntity,
    this.count = 0,
  });

  /// يحسب المجموع الكلي لوحدة القياس
  /// من خلال ضرب وحدة القياس للمنتج مع العدد
  num totalUnitAmount() {
    return productsEntity.unitAmount * count;
  }

  /// يحسب السعر الكلي للعنصر
  /// من خلال ضرب سعر المنتج مع العدد
  num totalPrice() {
    return productsEntity.productPrice * count;
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
  List<Object?> get props => [productsEntity];
}
