import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/core/theme/application_theme_manager.dart';
import 'package:frutes_app/core/utils/config_reader.dart';
import 'core/routes/page_routes_name.dart';
import 'core/routes/routes.dart';
import 'core/services/bloc_observer_service.dart';
import 'core/services/get_it_services.dart';
import 'core/services/shared_preferences_sengltion.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Features/Home/Cart/presentation/manager/cubits/Cart_cubit/cart_cubit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Features/auth/data/models/user_model.dart';
import 'core/model/Products/product_model.dart';
import 'core/model/Products/reviews_model.dart';
import 'Features/Home/Cart/domain/cart_item_entity.dart';
import 'Features/Home/Cart/domain/cart_entity.dart';
import 'Features/check_out/data/models/address_model.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserverService();

  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(ReviewsModelAdapter());
  Hive.registerAdapter(CartItemEntityAdapter());
  Hive.registerAdapter(CartEntityAdapter());
  Hive.registerAdapter(AddressModelAdapter());
  await Hive.openBox<UserModel>('userBox');
  await Hive.openBox<ProductModel>('productBox');
  await Hive.openBox<CartEntity>('cartBox');
  await Hive.openBox<AddressModel>('addresses');

  // Firebase configuration based on environment
  const devOptions = FirebaseOptions(
    apiKey: 'AIzaSyA99v6kzJO5LCgQcZvA3ZuuYpQ6jt0_9F0',
    appId: '1:244051247756:android:c83b13fce76349217c71a9',
    messagingSenderId: '244051247756',
    projectId: 'furute-fefa1',
  );
  const prodOptions = FirebaseOptions(
    apiKey: 'AIzaSyA99v6kzJO5LCgQcZvA3ZuuYpQ6jt0_9F0',
    appId: '1:244051247756:android:4949f37a25d791ef7c71a9',
    messagingSenderId: '244051247756',
    projectId: 'furute-fefa1',
  );
  await Firebase.initializeApp(
    options: env == 'dev' ? devOptions : prodOptions, 
  );
  // log(DebugConsoleMessages.debug(env == 'dev' ? 'Dev' : 'Prod'));

  await Prefs.init();
  setupGetit();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(create: (_) => CartCubit()),
        // Add other global providers here if needed
      ],
      child: const FruitApp(),
    ),
  );
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        builder: EasyLoading.init(
          builder: BotToastInit(),
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('ar'),
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: ConfigReader.isDevMode(),
        onGenerateRoute: Routes.generateRoute,
        initialRoute: PageRoutesName.initial,
        navigatorKey: navigatorKey,
        theme: ApplicationThemeManager.applicationThemeData,
      ),
    );
  }
}
