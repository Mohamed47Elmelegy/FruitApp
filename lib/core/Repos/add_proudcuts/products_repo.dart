import 'package:dartz/dartz.dart';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';

import '../../errors/failure.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductsEntity>>> getProducts();
  Future<Either<Failure, List<ProductsEntity>>> getBestSellingProducts();
}
