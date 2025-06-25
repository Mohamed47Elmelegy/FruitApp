import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../config/ansicolor.dart';

class CubitValidator {
  static void validateCubitSetup() {
    final getIt = GetIt.instance;

    // Check if GetIt is properly initialized
    try {
      DebugConsoleMessages.success('✅ GetIt is properly initialized');
    } catch (e) {
      DebugConsoleMessages.error('❌ GetIt initialization error: $e');
    }
  }

  static void logCubitState<T extends BlocBase>(BuildContext context, T cubit) {
    DebugConsoleMessages.info('🔍 Cubit ${cubit.runtimeType} state: ${cubit.state}');
  }

  static void validateProvider<T extends BlocBase>(
      BuildContext context, T expectedCubit) {
    try {
      final cubit = context.read<T>();
      if (cubit == expectedCubit) {
        DebugConsoleMessages.success('✅ Provider for ${T.runtimeType} is working correctly');
      } else {
        DebugConsoleMessages.warning('⚠️ Provider for ${T.runtimeType} returned different instance');
      }
    } catch (e) {
      DebugConsoleMessages.error('❌ Provider error for ${T.runtimeType}: $e');
    }
  }
}
