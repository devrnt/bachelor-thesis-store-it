import 'package:flutter/foundation.dart';

@immutable
class Preferences {
  final bool isDarkTheme;

  Preferences({this.isDarkTheme = false});
}
