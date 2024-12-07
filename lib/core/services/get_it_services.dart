import 'package:frutes_app/core/services/database_service.dart';
import 'package:frutes_app/core/services/firebase_auth_service.dart';
import 'package:frutes_app/core/services/firebase_firestore.dart';
import 'package:get_it/get_it.dart';
import '../../Features/auth/data/RepositoriesImplemnet/auth_repo_impl.dart';
import '../../Features/auth/domain/repositories/auth_repo.dart';

final getIt = GetIt.instance;
void getItSetup() {
  getIt.registerLazySingleton<FirbaseAuthService>(() => FirbaseAuthService());
  getIt
      .registerLazySingleton<DatabaseService>(() => FirebaseFirestoreService());
  getIt.registerLazySingleton<AuthRepo>(() =>
      AuthRepoImpl(getIt<FirbaseAuthService>(), getIt<DatabaseService>()));
}
