import 'package:flutter/material.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import '../widgets/custom_button_navigatoin_bar.dart';
import '../widgets/main_view_body_bloc_consumer.dart';

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
        key: ValueKey<int>(currentViewIndex),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: MainViewBodyBlocConsumer(currentViewIndex: currentViewIndex)
                .setHorizontalPadding(
              context,
              16,
              enableMediaQuery: false,
            ),
          ),
        ),
      ),
    );
  }
}
