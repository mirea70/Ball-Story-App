import 'package:flutter/cupertino.dart';

class DeviceInfo {
  static late Size size;
  static late EdgeInsets padding;
  static bool _initialized = false;

  static void init(BuildContext context) {
    if (_initialized) return;

    final mediaQuery = MediaQuery.of(context);
    size = mediaQuery.size;
    padding = mediaQuery.padding;
    _initialized = true;
  }
}
