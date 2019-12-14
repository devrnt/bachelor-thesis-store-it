import 'package:mobx/mobx.dart';

part 'preferences.g.dart';

class Preferences = _Preferences with _$Preferences;

abstract class _Preferences with Store {
  @observable
  bool isDarkTheme = false;

  @action
  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
  }
}
