import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entity/order_entity.dart';
import '../../domain/usecase/save_order_usecase.dart';
import '../../domain/usecases/confirm_order_usecase.dart';
import '../../../Home/Cart/domain/cart_entity.dart';
import '../../data/models/address_model.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final SaveOrderUseCase saveOrderUseCase;
  final ConfirmOrderUseCase confirmOrderUseCase;
  OrderCubit(this.saveOrderUseCase, this.confirmOrderUseCase)
      : super(OrderInitial());

  Future<void> saveOrder(OrderEntity order) async {
    emit(OrderLoading());
    try {
      final trackingNumber = await saveOrderUseCase(order);
      emit(OrderSuccess(trackingNumber));
    } catch (e) {
      emit(OrderFailure(e.toString()));
    }
  }

  Future<void> confirmOrder(
      {required CartEntity cart, required AddressModel? address}) async {
    emit(OrderLoading());
    try {
      final order = await confirmOrderUseCase(cart: cart, address: address);
      final trackingNumber = await saveOrderUseCase(order);
      emit(OrderSuccess(trackingNumber));
    } catch (e) {
      emit(OrderFailure(e.toString()));
    }
  }
}
