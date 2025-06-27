// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:frutes_app/core/Repos/add_proudcuts/products_repo.dart';
import 'package:frutes_app/core/constants/sort_options.dart';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';
import 'package:frutes_app/core/services/sort_service.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(
    this.productsRepo,
  ) : super(ProductsInitial());

  final ProductsRepo productsRepo;
  List<ProductsEntity> _allProducts = [];
  SortOption _currentSortOption = SortOption.priceLowToHigh;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final products = await productsRepo.getProducts();
    if (isClosed) return;
    products.fold(
      (failure) {
        if (!isClosed) emit(ProductsFailure(failure.message));
      },
      (product) {
        _allProducts = product;
        _applySorting();
      },
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final products = await productsRepo.getBestSellingProducts();
    if (isClosed) return;
    products.fold(
      (failure) {
        if (!isClosed) emit(ProductsFailure(failure.message));
      },
      (product) {
        _allProducts = product;
        _applySorting();
      },
    );
  }

  void sortProducts(SortOption sortOption) {
    _currentSortOption = sortOption;
    _applySorting();
  }

  void _applySorting() {
    if (_allProducts.isNotEmpty) {
      final sortedProducts =
          SortService.sortProducts(_allProducts, _currentSortOption);
      if (!isClosed) emit(ProductsSuccess(sortedProducts));
    }
  }
}
