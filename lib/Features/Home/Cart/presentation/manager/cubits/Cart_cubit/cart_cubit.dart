import 'package:bloc/bloc.dart';
import 'package:frutes_app/Features/Home/Cart/domain/cart_entity.dart';
import 'package:frutes_app/Features/Home/Cart/domain/cart_item_entity.dart';
import 'package:hive/hive.dart';
import 'package:frutes_app/core/model/Products/product_model.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial()) {
    cartEntity = getCart() ?? CartEntity(cartItems: []);
  }
  CartEntity cartEntity = CartEntity(cartItems: []);

  void addToCart(ProductModel productModel) {
    bool isProductExist = cartEntity.isExist(productModel);
    var cartItem = cartEntity.getCartItem(productModel);
    if (isProductExist) {
      cartItem.increaseItemCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    saveCart(cartEntity);
    emit(AddItemToCart());
  }

  void removeCartItem(CartItemEntity cartItem) {
    cartEntity.removeCartItem(cartItem);
    saveCart(cartEntity);
    emit(RemoveItemFromCart());
  }

  // Save the cart to Hive
  Future<void> saveCart(CartEntity cart) async {
    var cartBox = Hive.box<CartEntity>('cartBox');
    await cartBox.put('currentCart', cart);
  }

  // Retrieve the cart from Hive
  CartEntity? getCart() {
    var cartBox = Hive.box<CartEntity>('cartBox');
    return cartBox.get('currentCart');
  }

  // دالة لتفريغ السلة وحذفها من التخزين المحلي
  Future<void> clearCart() async {
    cartEntity.cartItems.clear();
    var cartBox = Hive.box<CartEntity>('cartBox');
    await cartBox.delete('currentCart');
    emit(CartInitial());
  }
}
