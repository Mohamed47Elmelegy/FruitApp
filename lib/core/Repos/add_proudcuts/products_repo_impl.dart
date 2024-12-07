// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';

import 'package:frutes_app/core/errors/failure.dart';
import 'package:frutes_app/core/services/database_service.dart';

import 'products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  DatabaseService databaseService;
  ProductsRepoImpl({
    required this.databaseService,
  });

  @override
  Future<Either<Failure, List<ProductsEntity>>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductsEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }
}
