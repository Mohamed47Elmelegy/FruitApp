import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/services/app_settings_service.dart';
import '../../../Home/Cart/domain/cart_entity.dart';
import '../entity/order_entity.dart';
import '../../data/models/address_model.dart';

class ConfirmOrderUseCase {
  final AppSettingsService appSettingsService;
  final FirebaseAuth firebaseAuth;

  ConfirmOrderUseCase({
    required this.appSettingsService,
    required this.firebaseAuth,
  });

  Future<OrderEntity> call({
    required CartEntity cart,
    required AddressModel? address,
  }) async {
    final subtotal = cart.calculateTotalPrice();
    final settings = await AppSettingsService.fetchAppSettings();
    final delivery = settings.deliveryFee;
    final total = subtotal + delivery;
    final uid = firebaseAuth.currentUser?.uid ?? '';

    final order = OrderEntity(
      uid: uid,
      products: cart.cartItems
          .map((item) => {
                'productCode': item.productModel.productCode,
                'name': item.productModel.productName,
                'count': item.count,
                'price': item.productModel.productPrice,
              })
          .toList(),
      subtotal: subtotal,
      delivery: delivery,
      total: total,
      createdAt: DateTime.now().toIso8601String(),
      address: address != null
          ? {
              'fullName': address.fullName,
              'email': address.email,
              'address': address.address,
              'city': address.city,
              'details': address.details,
            }
          : null,
      status: 'pending',
    );
    return order;
  }
}
