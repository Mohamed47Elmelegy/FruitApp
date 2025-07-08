import 'dart:developer';
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
import '../../Features/check_out/domain/usecase/get_user_orders_usecase.dart';
import '../../Features/check_out/domain/usecase/delete_order_usecase.dart';
import '../../Features/check_out/domain/usecase/cancel_order_usecase.dart';
import 'package:frutes_app/Features/check_out/domain/usecases/confirm_order_usecase.dart';
import 'package:frutes_app/core/services/app_settings_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

final getIt = GetIt.instance;

void setupGetit() {
  try {
    // Clear any existing registrations
    if (getIt.isRegistered<FirbaseAuthService>()) {
      getIt.unregister<FirbaseAuthService>();
    }
    if (getIt.isRegistered<DatabaseService>()) {
      getIt.unregister<DatabaseService>();
    }
    if (getIt.isRegistered<AuthRepo>()) {
      getIt.unregister<AuthRepo>();
    }
    if (getIt.isRegistered<ProductsRepo>()) {
      getIt.unregister<ProductsRepo>();
    }
    if (getIt.isRegistered<AddressRepository>()) {
      getIt.unregister<AddressRepository>();
    }
    if (getIt.isRegistered<OrderRepository>()) {
      getIt.unregister<OrderRepository>();
    }

    // Register services with error handling
    try {
      getIt.registerSingleton<FirbaseAuthService>(FirbaseAuthService());
    } catch (e) {
      log('Failed to register FirbaseAuthService: $e');
    }

    try {
      getIt.registerSingleton<DatabaseService>(FirebaseFirestoreService());
    } catch (e) {
      log('Failed to register DatabaseService: $e');
    }

    // Register repositories with error handling
    try {
      if (getIt.isRegistered<FirbaseAuthService>() &&
          getIt.isRegistered<DatabaseService>()) {
        getIt.registerSingleton<AuthRepo>(
          AuthRepoImpl(
            getIt<FirbaseAuthService>(),
            getIt<DatabaseService>(),
          ),
        );
      }
    } catch (e) {
      log('Failed to register AuthRepo: $e');
    }

    try {
      if (getIt.isRegistered<DatabaseService>()) {
        getIt.registerSingleton<ProductsRepo>(
          ProductsRepoImpl(
            getIt<DatabaseService>(),
          ),
        );
      }
    } catch (e) {
      log('Failed to register ProductsRepo: $e');
    }

    // Register address repository - using hybrid implementation for best of both worlds
    try {
      getIt.registerSingleton<AddressRepository>(
        AddressRepositoryHybrid(),
      );
    } catch (e) {
      log('Failed to register AddressRepository: $e');
    }

    // Register order repository
    try {
      if (getIt.isRegistered<DatabaseService>()) {
        getIt.registerSingleton<OrderRepository>(
          OrderRepositoryImpl(databaseService: getIt<DatabaseService>()),
        );
      }
    } catch (e) {
      log('Failed to register OrderRepository: $e');
    }

    // Register save order usecase
    try {
      if (getIt.isRegistered<OrderRepository>()) {
        getIt.registerSingleton<SaveOrderUseCase>(
          SaveOrderUseCase(getIt<OrderRepository>()),
        );
      }
    } catch (e) {
      log('Failed to register SaveOrderUseCase: $e');
    }

    // Register get user orders usecase
    try {
      if (getIt.isRegistered<OrderRepository>()) {
        getIt.registerSingleton<GetUserOrdersUseCase>(
          GetUserOrdersUseCase(getIt<OrderRepository>()),
        );
      }
    } catch (e) {
      log('Failed to register GetUserOrdersUseCase: $e');
    }

    // Register delete order usecase
    try {
      if (getIt.isRegistered<OrderRepository>()) {
        getIt.registerSingleton<DeleteOrderUseCase>(
          DeleteOrderUseCase(getIt<OrderRepository>()),
        );
      }
    } catch (e) {
      log('Failed to register DeleteOrderUseCase: $e');
    }

    // Register cancel order usecase
    try {
      if (getIt.isRegistered<OrderRepository>()) {
        getIt.registerSingleton<CancelOrderUseCase>(
          CancelOrderUseCase(getIt<OrderRepository>()),
        );
      }
    } catch (e) {
      log('Failed to register CancelOrderUseCase: $e');
    }

    // Register AppSettingsService
    try {
      getIt.registerSingleton<AppSettingsService>(AppSettingsService());
    } catch (e) {
      log('Failed to register AppSettingsService: $e');
    }

    // Register FirebaseAuth
    try {
      getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
    } catch (e) {
      log('Failed to register FirebaseAuth: $e');
    }

    // Register ConfirmOrderUseCase
    try {
      if (getIt.isRegistered<AppSettingsService>() &&
          getIt.isRegistered<FirebaseAuth>()) {
        getIt.registerSingleton<ConfirmOrderUseCase>(
          ConfirmOrderUseCase(
            appSettingsService: getIt<AppSettingsService>(),
            firebaseAuth: getIt<FirebaseAuth>(),
          ),
        );
      }
    } catch (e) {
      log('Failed to register ConfirmOrderUseCase: $e');
    }

    DebugConsoleMessages.success('✅ All dependencies registered successfully');
  } catch (e) {
    DebugConsoleMessages.error('❌ Error registering dependencies: $e');
    // Don't rethrow - let the app continue with partial functionality
  }
}
