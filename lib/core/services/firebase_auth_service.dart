import 'package:firebase_auth/firebase_auth.dart';

import '../errors/custom_exception.dart';
import '../errors/validators_erros.dart';

class FirbaseAuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(
          message: ValidatorsErrors.validatePassword(null) ??
              'كلمة المرور ضعيفة جداً.',
        );
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: ValidatorsErrors.validateEmail(null) ??
              'البريد الالكتروني مستخدم من قبل.',
        );
      } else {
        throw CustomException(
          message: 'حدث خطأ  في الاتصال بالسيرفر, حاول مرة ثانية',
        );
      }
    } catch (e) {
      throw CustomException(
        message: 'حدث خطأ  في الاتصال بالسيرفر, حاول مرة ثانية',
      );
    }
  }
}
