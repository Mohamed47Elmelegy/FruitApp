import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Features/check_out/domain/entity/order_entity.dart';
import '../../../../../../Features/check_out/domain/usecase/get_user_orders_usecase.dart';
import '../../../../../../Features/check_out/domain/usecase/delete_order_usecase.dart';
import '../../../../../../Features/check_out/domain/usecase/cancel_order_usecase.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final GetUserOrdersUseCase getUserOrdersUseCase;
  final DeleteOrderUseCase deleteOrderUseCase;
  final CancelOrderUseCase cancelOrderUseCase;

  OrdersCubit(this.getUserOrdersUseCase, this.deleteOrderUseCase,
      this.cancelOrderUseCase)
      : super(OrdersInitial());

  Future<void> loadUserOrders(String userId) async {
    emit(OrdersLoading());
    try {
      final orders = await getUserOrdersUseCase(userId);
      emit(OrdersSuccess(orders));
    } catch (e) {
      emit(OrdersFailure(e.toString()));
    }
  }

  Future<void> deleteOrder(String orderId, String userId) async {
    emit(OrdersLoading());
    try {
      await deleteOrderUseCase(orderId);
      // إعادة تحميل الطلبات بعد الحذف
      final orders = await getUserOrdersUseCase(userId);
      emit(OrdersSuccess(orders));
    } catch (e) {
      emit(OrdersFailure(e.toString()));
    }
  }

  Future<void> cancelOrder(String orderId, String userId,
      {String? notes}) async {
    emit(OrdersLoading());
    try {
      await cancelOrderUseCase(orderId, notes: notes);
      // إعادة تحميل الطلبات بعد الإلغاء
      final orders = await getUserOrdersUseCase(userId);
      emit(OrdersSuccess(orders));
    } catch (e) {
      emit(OrdersFailure(e.toString()));
    }
  }

  List<OrderEntity> getOrdersByStatus(List<OrderEntity> orders, String status) {
    return orders.where((order) => order.status == status).toList();
  }
}
