import 'package:flutter/material.dart';
import 'package:frutes_app/core/services/shared_preferences_sengltion.dart';
import 'package:frutes_app/core/theme/application_theme_manager.dart';
import 'core/routes/page_routes_name.dart';
import 'core/routes/routes.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
