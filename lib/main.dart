import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:frutes_app/core/theme/application_theme_manager.dart';
import 'package:frutes_app/core/utils/config_reader.dart';
import 'core/config/ansicolor.dart';
import 'core/routes/page_routes_name.dart';
import 'core/routes/routes.dart';
import 'core/services/bloc_observer_service.dart';
import 'core/services/get_it_services.dart';
import 'core/services/shared_preferences_sengltion.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserverService();

  // Firebase configuration based on environment
  if (env == 'dev') {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyA99v6kzJO5LCgQcZvA3ZuuYpQ6jt0_9F0',
        appId: '1:244051247756:android:c83b13fce76349217c71a9',
        messagingSenderId: '244051247756',
        projectId: 'furute-fefa1',
      ),
    );
    log(DebugConsoleMessages.debug('Dev'));
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyA99v6kzJO5LCgQcZvA3ZuuYpQ6jt0_9F0',
        appId: '1:244051247756:android:4949f37a25d791ef7c71a9',
        messagingSenderId: '244051247756',
        projectId: 'furute-fefa1',
      ),
    );
    log('Prod');
  }

  await Prefs.init();
  getItSetup();
  runApp(const FruitApp());
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
