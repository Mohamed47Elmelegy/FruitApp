import 'package:flutter/material.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import '../widgets/custom_button_navigatoin_bar.dart';
import '../widgets/main_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButtonNavigationBar(
        onItemTapped: (index) {
          currentViewIndex = index;
          setState(() {});
        },
      ),
      body: SafeArea(
        child: MainViewBody(currentViewIndex: currentViewIndex).setHorizontalPadding(
          context,
          16,
          enableMediaQuery: false,
        ),
      ),
    );
  }
}
