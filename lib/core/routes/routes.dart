import 'package:flutter/material.dart';
import 'package:frutes_app/Features/Home/presentation/view/home_view.dart';
import 'package:frutes_app/core/routes/page_routes_name.dart';
import '../../Features/auth/Presentation/Splash/view/splash_view.dart';
import '../../Features/auth/Presentation/signIn/view/signin_view.dart';
import '../../Features/auth/Presentation/onBording/widgets/onbording_view_body.dart';
import '../../Features/auth/Presentation/signUp/view/signup_view.dart';
import '../../Features/best_selling_view/Presentation/views/best_selling_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case PageRoutesName.signin:
        return MaterialPageRoute(builder: (context) => const SigninView());
      case PageRoutesName.signup:
        return MaterialPageRoute(builder: (context) => const SignupView());
      case PageRoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case PageRoutesName.bestSellingView:
        return MaterialPageRoute(builder: (context) => const BestSellingView());
      case PageRoutesName.onBording:
        return MaterialPageRoute(
            builder: (context) => const OnBordingViewBody());
      default:
        return MaterialPageRoute(builder: (context) => const SplashView());
    }
  }
}
