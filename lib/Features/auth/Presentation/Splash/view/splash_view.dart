import 'package:firebase_auth/firebase_auth.dart';
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
    // التحقق من لغة التطبيق الحالية
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
    bool isOnBordingViewSeen = Prefs.getBool(SharedPrefs.hasSeenOnboarding);
    var isLoggedIn = FirbaseAuthService().isLoggedIn();
    // bool isLoggedIn = Prefs.getBool(SharedPrefs.isLoggedIn);
    Future.delayed(
      const Duration(seconds: 3),
      () {
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
      },
    );
  }
}
