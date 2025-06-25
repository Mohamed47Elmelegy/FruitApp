import 'package:frutes_app/core/Repos/add_proudcuts/products_repo.dart';
import 'package:frutes_app/core/services/database_service.dart';
import 'package:frutes_app/core/services/firebase_auth_service.dart';
import 'package:frutes_app/core/services/firebase_firestore.dart';
import 'package:get_it/get_it.dart';
import '../../Features/auth/data/RepositoriesImplemnet/auth_repo_impl.dart';
import '../../Features/auth/domain/repositories/auth_repo.dart';
import '../Repos/add_proudcuts/products_repo_impl.dart';
import '../../Features/check_out/domain/Repositories/address_repository.dart';
import '../../Features/check_out/data/repositories/address_repository_hybrid.dart';
import '../config/ansicolor.dart';
import '../../Features/check_out/domain/Repositories/order_repository.dart';
import '../../Features/check_out/data/Repositories/order_repository_impl.dart';
import '../../Features/check_out/domain/usecase/save_order_usecase.dart';

final getIt = GetIt.instance;

void setupGetit() {
  try {
    // Register services
    getIt.registerSingleton<FirbaseAuthService>(FirbaseAuthService());
    getIt.registerSingleton<DatabaseService>(FirebaseFirestoreService());

    // Register repositories
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

    // Register address repository - using hybrid implementation for best of both worlds
    getIt.registerSingleton<AddressRepository>(
      AddressRepositoryHybrid(),
    );

    // Register order repository
    getIt.registerSingleton<OrderRepository>(
      OrderRepositoryImpl(databaseService: getIt<DatabaseService>()),
    );

    // Register save order usecase
    getIt.registerSingleton<SaveOrderUseCase>(
      SaveOrderUseCase(getIt<OrderRepository>()),
    );

    DebugConsoleMessages.success('✅ All dependencies registered successfully');
  } catch (e) {
    DebugConsoleMessages.error('❌ Error registering dependencies: $e');
    rethrow;
  }
}
