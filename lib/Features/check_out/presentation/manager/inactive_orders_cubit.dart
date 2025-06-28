import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/get_inactive_orders_usecase.dart';
import '../../domain/entity/order_tracking_entity.dart';

part 'inactive_orders_state.dart';

class InactiveOrdersCubit extends Cubit<InactiveOrdersState> {
  final GetInactiveOrdersUseCase getInactiveOrdersUseCase;

  InactiveOrdersCubit(this.getInactiveOrdersUseCase)
      : super(InactiveOrdersInitial());

  Future<void> loadInactiveOrders(String userId) async {
    emit(InactiveOrdersLoading());

    try {
      final orders = await getInactiveOrdersUseCase(userId);
      emit(InactiveOrdersLoaded(orders));
    } catch (e) {
      emit(InactiveOrdersError(e.toString()));
    }
  }

  void refreshOrders(String userId) {
    loadInactiveOrders(userId);
  }
}
