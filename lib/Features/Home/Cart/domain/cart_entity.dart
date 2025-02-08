import 'package:frutes_app/Features/Home/Cart/domain/cart_item_entity.dart';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({
    required this.cartItems,
  });

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  removeCartItem(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.totalPrice().round();
    }
    return totalPrice;
  }

  /// هذه الدالة يتم استخدامها للتحقق من وجود منتج في السلة
  bool isExist(ProductsEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productsEntity == product) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductsEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productsEntity == product) {
        return cartItem;
      }
    }
    return CartItemEntity(productsEntity: product, count: 1);
  }
}
