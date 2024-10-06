import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frutes_app/core/widgets/butn.dart';
import 'package:frutes_app/main.dart';

import '../../../../core/constants/prefs.dart';
import '../../../../core/routes/page_routes_name.dart';
import '../../../../core/services/shared_preferences_sengltion.dart';
import '../../../../core/theme/colors_theme.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Home View'),
          ),
          Butn(
              text: 'تسجل خروج',
              color: AppColors.green1_500,
              onPressed: () {
                auth.signOut().then((value) {
                  Prefs.remove(SharedPrefs.isLoggedIn);
                  navigatorKey.currentState!
                      .pushReplacementNamed(PageRoutesName.signin);
                });
              }),
        ],
      ),
    );
  }
}
