import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/Features/Home/Cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:frutes_app/core/extensions/padding_ext.dart';
import '../widgets/custom_button_navigatoin_bar.dart';
import '../widgets/main_view_body.dart';
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
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        bottomNavigationBar: CustomButtonNavigationBar(
          onItemTapped: (index) {
            currentViewIndex = index;
            setState(() {});
          },
        ),
        body: SafeArea(
          child: MainViewBodyBlocConsumer(currentViewIndex: currentViewIndex)
              .setHorizontalPadding(
            context,
            16,
            enableMediaQuery: false,
          ),
        ),
      ),
    );
  }
}

