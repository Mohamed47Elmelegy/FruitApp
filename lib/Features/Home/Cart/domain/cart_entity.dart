import 'package:frutes_app/Features/Home/Cart/domain/cart_item_entity.dart';
import 'package:hive/hive.dart';
import 'package:frutes_app/core/model/Products/product_model.dart';

part 'cart_entity.g.dart';

@HiveType(typeId: 4)
class CartEntity {
  @HiveField(0)
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
  bool isExist(ProductModel product) {
    for (var cartItem in cartItems) {
      if (cartItem.productModel == product) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductModel product) {
    for (var cartItem in cartItems) {
      if (cartItem.productModel == product) {
        return cartItem;
      }
    }
    return CartItemEntity(productModel: product, count: 1);
  }
}
