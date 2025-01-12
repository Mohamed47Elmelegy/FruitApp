part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductsEntity> products;
  ProductsSuccess(this.products);
}

final class ProductsFailure extends ProductsState {
  final String errMessage;
  ProductsFailure(this.errMessage);
}
