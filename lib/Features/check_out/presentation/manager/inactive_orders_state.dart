part of 'inactive_orders_cubit.dart';

abstract class InactiveOrdersState {}

class InactiveOrdersInitial extends InactiveOrdersState {}

class InactiveOrdersLoading extends InactiveOrdersState {}

class InactiveOrdersLoaded extends InactiveOrdersState {
  final List<OrderTrackingEntity> orders;

  InactiveOrdersLoaded(this.orders);
}

class InactiveOrdersError extends InactiveOrdersState {
  final String message;

  InactiveOrdersError(this.message);
}
