import 'package:dartz/dartz.dart';
import 'package:frutes_app/core/entities/proudcuts_entity.dart';

import 'package:frutes_app/core/errors/failure.dart';
import 'package:frutes_app/core/services/database_service.dart';

import '../../constants/backend_point.dart';
import '../../model/Products/product_model.dart';
import 'products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  DatabaseService databaseService;
  ProductsRepoImpl({
    required this.databaseService,
  });

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

  @override
  Future<Either<Failure, List<ProductsEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }
}
