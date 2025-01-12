import 'dart:developer';
import 'package:frutes_app/core/utils/environment.dart';
import 'package:frutes_app/main.dart';
import 'core/config/ansicolor.dart';

Future<void> main() async {
  await mainCommon(Environment.prod);
  log(DebugConsoleMessages.debug('Prod'));
}
