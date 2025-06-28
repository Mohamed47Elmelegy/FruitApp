part of 'active_orders_cubit.dart';

abstract class ActiveOrdersState {}

class ActiveOrdersInitial extends ActiveOrdersState {}

class ActiveOrdersLoading extends ActiveOrdersState {}

class ActiveOrdersLoaded extends ActiveOrdersState {
  final List<OrderTrackingEntity> orders;

  ActiveOrdersLoaded(this.orders);
}

class ActiveOrdersError extends ActiveOrdersState {
  final String message;

  ActiveOrdersError(this.message);
}
