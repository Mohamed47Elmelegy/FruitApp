import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frutes_app/core/widgets/butn.dart';
import 'package:frutes_app/main.dart';

import '../../../../core/routes/page_routes_name.dart';
import '../../../../core/theme/colors_theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  signOut() async {
    await auth.signOut();
    navigatorKey.currentState!.pushReplacementNamed(PageRoutesName.signin);
  }

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
              color: AppColors.green1_600,
              onPressed: () {
                signOut();
              }),
        ],
      ),
    );
  }
}
