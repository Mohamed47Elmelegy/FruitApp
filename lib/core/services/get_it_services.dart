import 'package:frutes_app/core/Repos/add_proudcuts/products_repo.dart';
import 'package:frutes_app/core/services/database_service.dart';
import 'package:frutes_app/core/services/firebase_auth_service.dart';
import 'package:frutes_app/core/services/firebase_firestore.dart';
import 'package:get_it/get_it.dart';
import '../../Features/auth/data/RepositoriesImplemnet/auth_repo_impl.dart';
import '../../Features/auth/domain/repositories/auth_repo.dart';
import '../Repos/add_proudcuts/products_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirbaseAuthService>(FirbaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirebaseFirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      getIt<FirbaseAuthService>(),
      getIt<DatabaseService>(),
    ),
  );

  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(
      getIt<DatabaseService>(),
    ),
  );
}
