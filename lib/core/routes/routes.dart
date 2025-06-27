import 'package:flutter/material.dart';
import 'package:frutes_app/Features/Home/Cart/presentation/view/cart_view.dart';
import 'package:frutes_app/core/routes/page_routes_name.dart';
import '../../Features/Home/Products/presentation/view/products_view.dart';
import '../../Features/Home/Products/presentation/widgets/product_info/product_details_view_body.dart';
import '../../Features/Home/Profile/presentation/view/profile_view.dart';
import '../../Features/Home/Profile/presentation/view/orders_view.dart';
import '../../Features/Home/presentation/view/main_view.dart';
import '../../Features/auth/Presentation/Splash/view/splash_view.dart';
import '../../Features/auth/Presentation/signIn/view/signin_view.dart';
import '../../Features/auth/Presentation/onBording/widgets/onbording_view_body.dart';
import '../../Features/auth/Presentation/signUp/view/signup_view.dart';
import '../../Features/best_selling_view/Presentation/views/best_selling_view.dart';
import '../../Features/check_out/presentation/view/checkout_view.dart';
import '../entities/proudcuts_entity.dart';
import '../../Features/Home/Profile/presentation/view/order_confirmed_view.dart';
import '../../Features/Home/Profile/presentation/view/order_tracking_view.dart';

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
        return MaterialPageRoute(builder: (context) => const MainView());
      case PageRoutesName.bestSellingView:
        return MaterialPageRoute(builder: (context) => const BestSellingView());
      case PageRoutesName.productView:
        return MaterialPageRoute(builder: (context) => const ProductsView());
      case PageRoutesName.cartView:
        return MaterialPageRoute(builder: (context) => const CartView());
      case PageRoutesName.profileView:
        return MaterialPageRoute(builder: (context) => const ProfileView());
      case PageRoutesName.ordersView:
        return MaterialPageRoute(builder: (context) => const OrdersView());
      case PageRoutesName.productDetails:
        final ProductsEntity product = settings.arguments as ProductsEntity;
        return MaterialPageRoute(
            builder: (context) => ProductDetailsViewBody(
                  product: product,
                ));
      case PageRoutesName.onBording:
        return MaterialPageRoute(
            builder: (context) => const OnBordingViewBody());
      case PageRoutesName.checkoutView:
        return MaterialPageRoute(builder: (context) => const CheckoutView());
      case PageRoutesName.orderConfirmed:
        final String trackingNumber = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) =>
                OrderConfirmedView(trackingNumber: trackingNumber));
      case PageRoutesName.orderTracking:
        final String trackingNumber = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) =>
                OrderTrackingView(trackingNumber: trackingNumber));
      // case PageRoutesName.paymentView:
      //   return MaterialPageRoute(builder: (context) => const PaymentView());
      default:
        return MaterialPageRoute(builder: (context) => const SplashView());
    }
  }
}
