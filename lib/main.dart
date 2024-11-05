import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import 'package:frutes_app/core/services/shared_preferences_sengltion.dart';
import 'package:frutes_app/core/theme/application_theme_manager.dart';
import 'core/routes/page_routes_name.dart';
import 'core/routes/routes.dart';
import 'core/services/bloc_observer_service.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserverService();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyA99v6kzJO5LCgQcZvA3ZuuYpQ6jt0_9F0',
              appId: '1:244051247756:android:4949f37a25d791ef7c71a9',
              messagingSenderId: '244051247756',
              projectId: 'furute-fefa1'))
      : await Firebase.initializeApp();
  await Prefs.init();
  getItSetup();
  runApp(const FruitApp());
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  // This widget is the root of your application.
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
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: PageRoutesName.initial,
      navigatorKey: navigatorKey,
      theme: ApplicationThemeManager.applicationThemeData,
    );
  }
}
