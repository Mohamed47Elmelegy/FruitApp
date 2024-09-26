import 'package:frutes_app/core/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

import '../../Features/auth/data/Repositories/auth_repo_impl.dart';
import '../../Features/auth/domin/repositories/auth_repo.dart';

/// registers all the services needed for the app
final getIt = GetIt.instance;
void getItSetup() {
  getIt.registerLazySingleton<FirbaseAuthService>(
    () => FirbaseAuthService(),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      getIt<FirbaseAuthService>(),
    ),
  );
}
