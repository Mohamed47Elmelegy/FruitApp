import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import '../config/ansicolor.dart';
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
      ); // Success log with green color
      log(DebugConsoleMessages.success(
          'User created successfully: ${userCredential.user!.email}'));
      return userCredential.user!; // Success log with green color
    } on FirebaseAuthException catch (e) {
      log(DebugConsoleMessages.error(
          'FirbaseAuthService.createUserWithEmailAndPassword Exception message : ${e.toString()}Exception e.code : ${e.code}'));
      if (e.code == 'network-request-failed') {
        throw CustomException(message: 'لا يوجد اتصال بالانترنت');
      }
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'البريد الالكتروني مستخدم من قبل.');
      } else {
        throw CustomException(
            message: 'حدث خطأ في الاتصال بالسيرفر, حاول مرة ثانية');
      }
    } catch (e) {
      // Critical error log with cyan color
      log(DebugConsoleMessages.critical(
          'Unknown error occurred: ${e.toString()}'));
      throw CustomException(
          message: 'حدث خطأ في الاتصال بالسيرفر, حاول مرة ثانية');
    }
  }
}
