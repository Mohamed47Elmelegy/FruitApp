import 'package:flutter/material.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import '../widgets/custom_button_navigatoin_bar.dart';
import 'home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButtonNavigationBar(
        onItemTapped: (int value) {},
      ),
      body: SafeArea(
        child: const HomeView().setHorizontalPadding(
          context,
          16,
          enableMediaQuery: false,
        ),
      ),
    );
  }
}
