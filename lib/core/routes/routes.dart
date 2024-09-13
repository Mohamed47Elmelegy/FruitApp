import 'package:flutter/material.dart';
import 'package:frutes_app/Presentation/onBording/widgets/onbording_view_body.dart';
import 'package:frutes_app/Presentation/signUp/view/signup_view_body.dart';
import '../../Presentation/Splash/view/splash_view.dart';
import 'package:frutes_app/core/routes/page_routes_name.dart';
import '../../Presentation/logIn/view/login_view_body.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case PageRoutesName.onBording:
        return MaterialPageRoute(
            builder: (context) => const OnBordingViewBody());
      case PageRoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginViewBody());
      case PageRoutesName.signUp:
        return MaterialPageRoute(builder: (context) => const SignupViewBody());
      default:
        return MaterialPageRoute(builder: (context) => const SplashView());
    }
  }
}
