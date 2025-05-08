part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}
final class AddItemToCart extends CartState {

}
final class RemoveItemFromCart extends CartState {

}