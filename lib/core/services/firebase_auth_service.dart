import 'package:firebase_auth/firebase_auth.dart';
import '../errors/custom_exception.dart';

class FirbaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'البريد الالكتروني مستخدم من قبل.');
      } else {
        throw CustomException(
            message: 'حدث خطأ في الاتصال بالسيرفر, حاول مرة ثانية');
      }
    } catch (e) {
      throw CustomException(
          message: 'حدث خطأ في الاتصال بالسيرفر, حاول مرة ثانية');
    }
  }
}
