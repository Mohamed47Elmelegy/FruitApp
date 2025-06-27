import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frutes_app/core/constants/prefs.dart';
import 'package:frutes_app/core/utils/app_images.dart';
import '../../../../../core/routes/page_routes_name.dart';
import '../../../../../core/services/firebase_auth_service.dart';
import '../../../../../core/services/shared_preferences_sengltion.dart';
import '../../../../../main.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigateBasedOnUserStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Scaffold(
      body: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (!isArabic) // عرض الصورة لليسار إذا كانت اللغة إنجليزية
                  SvgPicture.asset(
                    Assets.imagesPlant,
                  ),
                const Spacer(), // مسافة بينية
                if (isArabic) // عرض الصورة لليمين إذا كانت اللغة عربية
                  SvgPicture.asset(
                    Assets.imagesPlant,
                  ),
              ],
            ),
            SvgPicture.asset(Assets.imagesLogo),
            SvgPicture.asset(
              Assets.imagesCirclesSplash,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }

  void navigateBasedOnUserStatus() {
    try {
      bool isOnBordingViewSeen = Prefs.getBool(SharedPrefs.hasSeenOnboarding);
      var isLoggedIn = false;

      try {
        isLoggedIn = FirbaseAuthService().isLoggedIn();
      } catch (e) {
        log('Firebase Auth check failed: $e');
        // Default to not logged in if Firebase Auth fails
        isLoggedIn = false;
      }

      Future.delayed(
        const Duration(seconds: 3),
        () {
          try {
            if (isOnBordingViewSeen) {
              if (isLoggedIn) {
                // Navigate to Home page if the user is logged in
                navigatorKey.currentState
                    ?.pushReplacementNamed(PageRoutesName.home);
              } else {
                // Navigate to Login page if the user is not logged in
                navigatorKey.currentState
                    ?.pushReplacementNamed(PageRoutesName.signin);
              }
            } else {
              // Navigate to Onboarding page if the user hasn't seen it
              navigatorKey.currentState
                  ?.pushReplacementNamed(PageRoutesName.onBording);
            }
          } catch (e) {
            log('Navigation error: $e');
            // Fallback to onboarding if navigation fails
            try {
              navigatorKey.currentState
                  ?.pushReplacementNamed(PageRoutesName.onBording);
            } catch (fallbackError) {
              log('Fallback navigation also failed: $fallbackError');
            }
          }
        },
      );
    } catch (e) {
      log('Splash screen initialization error: $e');
      // Fallback navigation after delay
      Future.delayed(
        const Duration(seconds: 3),
        () {
          try {
            navigatorKey.currentState
                ?.pushReplacementNamed(PageRoutesName.onBording);
          } catch (fallbackError) {
            log('Final fallback navigation failed: $fallbackError');
          }
        },
      );
    }
  }
}
