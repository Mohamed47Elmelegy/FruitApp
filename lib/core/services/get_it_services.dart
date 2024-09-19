import 'package:frutes_app/core/services/firebase_auth_service.dart';
import 'package:frutes_app/data/auth/Repositories/auth_repo_impl.dart';
import 'package:frutes_app/domin/auth/repositories/auth_repo.dart';
import 'package:get_it/get_it.dart';

/// registers all the services needed for the app
final getIt = GetIt.instance;
void setup() {
  getIt.registerLazySingleton<FirbaseAuthService>(
    () => FirbaseAuthService(),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      getIt<FirbaseAuthService>(),
    ),
  );
}
