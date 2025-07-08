import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
      );

      // Print Firebase Auth token after successful user creation
      final firebaseIdToken = await userCredential.user?.getIdToken();
      log('🔥 FIREBASE AUTH TOKEN (User Creation):');
      log('Firebase ID Token: $firebaseIdToken');
      log('User UID: ${userCredential.user?.uid}');
      log('User Email: ${userCredential.user?.email}');
      log('🔥 END FIREBASE AUTH TOKEN (User Creation)');

      log(DebugConsoleMessages.success(
          'User created successfully: ${userCredential.user!.email}'));
      return userCredential.user!;
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

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Print Firebase Auth token after successful sign-in
      final firebaseIdToken = await userCredential.user?.getIdToken();
      log('🔥 FIREBASE AUTH TOKEN (Email/Password):');
      log('Firebase ID Token: $firebaseIdToken');
      log('User UID: ${userCredential.user?.uid}');
      log('User Email: ${userCredential.user?.email}');
      log('🔥 END FIREBASE AUTH TOKEN (Email/Password)');

      log(DebugConsoleMessages.success(
          'User signed in successfully: ${userCredential.user!.email}'));
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      log(DebugConsoleMessages.error(
          'FirbaseAuthService.signInWithEmailAndPassword Exception message : ${e.toString()}Exception e.code : ${e.code}'));
      if (e.code == 'network-request-failed') {
        throw CustomException(message: 'لا يوجد اتصال بالانترنت');
      }
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'البريد الالكتروني غير موجود.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'البريد الألكتروني او كلمة المرور غير صحيحة.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
            message: 'البريد الألكتروني او كلمة المرور غير صحيحة.');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'البريد الالكتروني غير صالح.');
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

  Future<User> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Print Google Sign-In tokens to console
      log('🔑 GOOGLE SIGN-IN TOKENS:');
      log('Access Token: ${googleAuth?.accessToken}');
      log('ID Token: ${googleAuth?.idToken}');
      log('Server Auth Code: ${googleAuth?.serverAuthCode}');
      log('🔑 END GOOGLE SIGN-IN TOKENS');

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Print Firebase Auth token after successful sign-in
      final firebaseIdToken = await userCredential.user?.getIdToken();
      log('🔥 FIREBASE AUTH TOKEN:');
      log('Firebase ID Token: $firebaseIdToken');
      log('User UID: ${userCredential.user?.uid}');
      log('User Email: ${userCredential.user?.email}');
      log('🔥 END FIREBASE AUTH TOKEN');

      log(DebugConsoleMessages.success(
          'User signed in successfully with Google: ${userCredential.user!.email}'));
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      log(DebugConsoleMessages.error(
          'FirbaseAuthService.signInWithGoogle Exception message : ${e.toString()}Exception e.code : ${e.code}'));

      if (e.code == 'network-request-failed') {
        throw CustomException(message: 'لا يوجد اتصال بالانترنت');
      } else {
        throw CustomException(
            message: 'حدث خطأ في الاتصال بالسيرفر, حاول مرة ثانية');
      }
    } catch (e) {
      // Critical error log with cyan color
      log(DebugConsoleMessages.critical(
          'Unknown error occurred while signing in with Google: ${e.toString()}'));
      throw CustomException(
          message: 'حدث خطأ في الاتصال بالسيرفر, حاول مرة ثانية');
    }
  }

  Future<User> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Print Facebook authentication tokens to console
      log('📘 FACEBOOK SIGN-IN TOKENS:');
      log('Access Token: ${loginResult.accessToken?.tokenString}');
      log('📘 END FACEBOOK SIGN-IN TOKENS');

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      final userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      // Print Firebase Auth token after successful sign-in
      final firebaseIdToken = await userCredential.user?.getIdToken();
      log('🔥 FIREBASE AUTH TOKEN (Facebook):');
      log('Firebase ID Token: $firebaseIdToken');
      log('User UID: ${userCredential.user?.uid}');
      log('User Email: ${userCredential.user?.email}');
      log('🔥 END FIREBASE AUTH TOKEN (Facebook)');

      log(DebugConsoleMessages.success(
          'User signed in successfully with Facebook: ${userCredential.user!.email}'));
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      log(DebugConsoleMessages.error(
          'An error occurred while signing in with Facebook: ${e.toString()}'));
      if (e.code == 'account-exists-with-different-credential') {
        throw CustomException(
            message:
                'يوجد حساب بالفيس بوك بهذا البريد الالكتروني, الرجاء الدخول بهذا البريد الالكتروني');
      } else {
        throw CustomException(
            message: 'حدث خطأ في الاتصال بالسيرفر, حاول مرة ثانية');
      }
    } catch (e) {
      // Critical error log with cyan color
      log(DebugConsoleMessages.critical(
          'Unknown error occurred while signing in with Facebook: ${e.toString()}'));
      throw CustomException(
          message: 'حدث خطأ في الاتصال بالسيرفر, حاول مرة ثانية');
    }
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    await FacebookAuth.instance.logOut();
    await GoogleSignIn().signOut();
    log(DebugConsoleMessages.success('User signed out successfully '));
  }

  Future<void> sendEmailVerification() async {
    try {
      final user = _firebaseAuth.currentUser;

      if (user != null) {
        log(DebugConsoleMessages.success(
            'User is logged in, proceeding to send email verification.'));
        // إرسال البريد الإلكتروني للتحقق
        await user.sendEmailVerification();
        log(DebugConsoleMessages.success(
            'Verification email sent successfully to ${user.email}'));
      } else {
        // في حالة عدم وجود مستخدم مسجل الدخول
        log(DebugConsoleMessages.error('No user logged in.'));
        throw CustomException(message: 'User is not logged in.');
      }
    } catch (e) {
      // في حالة حدوث خطأ
      log(DebugConsoleMessages.error('Error sending email verification: $e'));
      throw CustomException(
          message: 'There was an error sending the verification email.');
    }
  }
}
