import 'package:bloc/bloc.dart';
import 'package:frutes_app/Features/Home/Cart/domain/cart_entity.dart';
import 'package:frutes_app/Features/Home/Cart/domain/cart_item_entity.dart';
import 'package:hive/hive.dart';
import 'package:frutes_app/core/model/Products/product_model.dart';
import 'package:frutes_app/core/services/app_settings_service.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial()) {
    cartEntity = getCart() ?? CartEntity(cartItems: []);
  }
  CartEntity cartEntity = CartEntity(cartItems: []);

  Future<String?> addToCart(ProductModel productModel) async {
    final settings = await AppSettingsService.fetchAppSettings();
    final maxOrder = settings.maxOrderAmount;
    if (maxOrder > 0 && cartEntity.cartItems.length >= maxOrder) {
      return 'لا يمكنك إضافة أكثر من $maxOrder منتجات في السلة';
    }
    bool isProductExist = cartEntity.isExist(productModel);
    var cartItem = cartEntity.getCartItem(productModel);
    if (isProductExist) {
      cartItem.increaseItemCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    await saveCart(cartEntity);
    emit(AddItemToCart());
    return null;
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
