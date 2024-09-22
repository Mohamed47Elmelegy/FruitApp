class DebugConsoleMessages {
  static String error(String message) => '\x1B[31m$message\x1B[0m';
  static String success(String message) => '\x1B[32m$message\x1B[0m';
  static String warning(String message) => '\x1B[33m$message\x1B[0m';
  static String info(String message) => '\x1B[34m$message\x1B[0m';
  static String debug(String message) => '\x1B[35m$message\x1B[0m';
  static String critical(String message) => '\x1B[36m$message\x1B[0m';
  static String notice(String message) => '\x1B[37m$message\x1B[0m';
}
