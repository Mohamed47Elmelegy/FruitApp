import 'package:flutter/material.dart';
import '../widgets/custom_button_navigatoin_bar.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButtonNavigationBar(
        onItemTapped: (int value) {},
      ),
      body:const SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
