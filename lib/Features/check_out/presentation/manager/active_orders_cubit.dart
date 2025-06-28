import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/get_active_orders_usecase.dart';
import '../../domain/entity/order_tracking_entity.dart';

part 'active_orders_state.dart';

class ActiveOrdersCubit extends Cubit<ActiveOrdersState> {
  final GetActiveOrdersUseCase getActiveOrdersUseCase;

  ActiveOrdersCubit(this.getActiveOrdersUseCase) : super(ActiveOrdersInitial());

  Future<void> loadActiveOrders(String userId) async {
    emit(ActiveOrdersLoading());

    try {
      final orders = await getActiveOrdersUseCase(userId);
      emit(ActiveOrdersLoaded(orders));
    } catch (e) {
      emit(ActiveOrdersError(e.toString()));
    }
  }

  void refreshOrders(String userId) {
    loadActiveOrders(userId);
  }
}
