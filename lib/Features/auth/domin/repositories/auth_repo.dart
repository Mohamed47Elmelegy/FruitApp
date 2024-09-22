import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../Entities/user_entities.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntities>> creatUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  );

  Future<Either<Failure, UserEntities>> signInWithEmailAndPassword(
    String email,
    String password,
  );
}