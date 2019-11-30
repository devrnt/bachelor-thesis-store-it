import 'package:flutter/widgets.dart';

class Preferences extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;

    notifyListeners();
  }
}