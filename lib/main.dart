import 'dart:developer';
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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Features/Home/Cart/presentation/manager/cubits/Cart_cubit/cart_cubit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Features/auth/data/models/user_model.dart';
import 'core/model/Products/product_model.dart';
import 'core/model/Products/reviews_model.dart';
import 'Features/Home/Cart/domain/cart_item_entity.dart';
import 'Features/Home/Cart/domain/cart_entity.dart';
import 'Features/check_out/data/models/address_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> mainCommon(String env) async {
  log('🚀 Starting app initialization for environment: $env');

  try {
    log('📱 Initializing Flutter binding...');
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = BlocObserverService();

    // Initialize ConfigReader first
    log('⚙️ Initializing ConfigReader...');
    await ConfigReader.initialize(env);
    log('✅ ConfigReader initialized successfully');

    // Initialize Hive with error handling
    log('🗄️ Initializing Hive...');
    try {
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
      log('✅ Hive initialized successfully');
    } catch (e) {
      log('❌ Hive initialization error: $e');
      // Continue without Hive if it fails
    }

    // Firebase configuration based on environment
    log('🔥 Initializing Firebase...');
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

    try {
      await Firebase.initializeApp(
        options: env == 'dev' ? devOptions : prodOptions,
      );
      log('✅ Firebase initialized successfully');
    } catch (e) {
      log('❌ Firebase initialization error: $e');
      // Continue without Firebase if it fails
    }

    // Initialize SharedPreferences
    log('💾 Initializing SharedPreferences...');
    try {
      await Prefs.init();
      log('✅ SharedPreferences initialized successfully');
    } catch (e) {
      log('❌ SharedPreferences initialization error: $e');
    }

    // Setup GetIt services
    log('🔧 Setting up dependency injection...');
    try {
      setupGetit();
      log('✅ Dependency injection setup completed');
    } catch (e) {
      log('❌ GetIt setup error: $e');
    }

    log('🎯 Starting app...');
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<CartCubit>(create: (_) => CartCubit()),
          // Add other global providers here if neede
        ],
        child: const FruitApp(),
      ),
    );
    log('✅ App started successfully');
  } catch (e) {
    log('💥 Critical initialization error: $e');
    // Simple fallback app without error display
    runApp(const FruitApp());
  }
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
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.generateRoute,
        initialRoute: PageRoutesName.initial,
        navigatorKey: navigatorKey,
        theme: ApplicationThemeManager.applicationThemeData,
      ),
    );
  }
}
