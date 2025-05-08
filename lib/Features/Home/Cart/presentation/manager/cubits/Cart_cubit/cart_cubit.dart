import 'package:bloc/bloc.dart';
import 'package:frutes_app/Features/Home/Cart/domain/cart_entity.dart';
import 'package:frutes_app/Features/Home/Cart/domain/cart_item_entity.dart';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cartItems: []);
  void addToCart(ProductsEntity productsEntity) {
    bool isProductExist = cartEntity.isExist(productsEntity);
    var cartItem = cartEntity.getCartItem(productsEntity);
    if (isProductExist) {
      cartItem.increaseItemCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }

    emit(AddItemToCart());
  }

  void removeCartItem(CartItemEntity cartItem) {
    cartEntity.removeCartItem(cartItem);
    emit(RemoveItemFromCart());
  }
}
