
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/ansicolor.dart';

class BlocObserverService extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      DebugConsoleMessages.info(
          '🔄 ${bloc.runtimeType} changed: ${change.currentState.runtimeType} -> ${change.nextState.runtimeType}');
    }
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      DebugConsoleMessages.info(
          '🔄 ${bloc.runtimeType} transition: ${transition.event.runtimeType}');
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      DebugConsoleMessages.error('❌ ${bloc.runtimeType} error: $error');
      DebugConsoleMessages.info('📚 Stack trace: $stackTrace');
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      DebugConsoleMessages.info('🔒 ${bloc.runtimeType} closed');
    }
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      DebugConsoleMessages.info('🆕 ${bloc.runtimeType} created');
    }
  }
}
