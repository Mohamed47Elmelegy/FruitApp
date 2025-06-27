import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entity/order_entity.dart';
import '../../domain/usecase/save_order_usecase.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final SaveOrderUseCase saveOrderUseCase;
  OrderCubit(this.saveOrderUseCase) : super(OrderInitial());

  Future<void> saveOrder(OrderEntity order) async {
    emit(OrderLoading());
    try {
      final trackingNumber = await saveOrderUseCase(order);
      emit(OrderSuccess(trackingNumber));
    } catch (e) {
      emit(OrderFailure(e.toString()));
    }
  }
}
