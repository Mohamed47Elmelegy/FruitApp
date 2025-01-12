import 'dart:developer';
import 'package:frutes_app/core/config/ansicolor.dart';
import 'package:frutes_app/core/utils/environment.dart';
import 'package:frutes_app/main.dart';

Future<void> main() async {
  await mainCommon(Environment.dev);
  log(DebugConsoleMessages.debug('Dev'));
}
