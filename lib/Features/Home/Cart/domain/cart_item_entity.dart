import 'package:frutes_app/core/entities/proudcuts_entity.dart';

class CartItemEntity {
  final ProductsEntity productsEntity;
  int count;
  CartItemEntity({required this.productsEntity, this.count = 0});

  num get totalPrice => productsEntity.productPrice * count;

  num get totalUnitAmount => productsEntity.caloriesReferenceWeight * count;

  incrementCount() => count++;
  decrementCount() => count--;

}
