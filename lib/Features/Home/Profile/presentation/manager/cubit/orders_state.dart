part of 'orders_cubit.dart';

abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersSuccess extends OrdersState {
  final List<OrderEntity> orders;
  OrdersSuccess(this.orders);
}

class OrdersFailure extends OrdersState {
  final String message;
  OrdersFailure(this.message);
}
