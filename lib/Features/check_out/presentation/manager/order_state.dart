part of 'order_cubit.dart';

abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderSuccess extends OrderState {
  final String trackingNumber;
  OrderSuccess(this.trackingNumber);
}

class OrderFailure extends OrderState {
  final String message;
  OrderFailure(this.message);
}
