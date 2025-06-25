import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';

import 'package:frutes_app/core/errors/failure.dart';
import 'package:frutes_app/core/services/database_service.dart';

import '../../config/ansicolor.dart';
import '../../constants/backend_point.dart';
import '../../model/Products/product_model.dart';
import 'products_repo.dart';
import 'package:hive/hive.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;
  ProductsRepoImpl(
    this.databaseService,
  );
  @override
  Future<Either<Failure, List<ProductsEntity>>> getBestSellingProducts() async {
    try {
      log(DebugConsoleMessages.info(
          'Attempting to fetch best selling products')); // تتبع الاستعلام
      log(DebugConsoleMessages.info(
          'Backend Path: ${BackendPoint.getProduct}')); // طباعة مسار الخلفية
      var data = await databaseService.getData(
          path: BackendPoint.getProduct,
          query: {
            'limit': 10,
            'orderBy': 'sellingCount',
            'descending': true
          }) as List<Map<String, dynamic>>;
      log(DebugConsoleMessages.info(
          'Received data: $data')); // طباعة البيانات المستلمة

      List<ProductsEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      log(DebugConsoleMessages.success(
          'Best selling products fetched successfully: $products'));
      return right(products);
    } catch (e) {
      log(DebugConsoleMessages.error(
          'Error in getBestSellingProducts: $e')); // طباعة أي خطأ
      return left(ServerFailure('Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductsEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
          path:
              BackendPoint.getProduct) as List<
          Map<String, dynamic>>; //as Write if you Know what data are comeing
      List<ProductsEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure('Faild to get products'));
    }
  }

  // Save a list of products to Hive
  Future<void> saveProducts(List<ProductModel> products) async {
    var productBox = Hive.box<ProductModel>('productBox');
    for (var product in products) {
      await productBox.put(product.productCode, product);
    }
  }

  // Retrieve all products from Hive
  List<ProductModel> getAllProducts() {
    var productBox = Hive.box<ProductModel>('productBox');
    return productBox.values.toList();
  }

  // Retrieve a single product by code from Hive
  ProductModel? getProduct(String code) {
    var productBox = Hive.box<ProductModel>('productBox');
    return productBox.get(code);
  }
}
