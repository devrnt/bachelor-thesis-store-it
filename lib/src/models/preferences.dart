import 'package:scoped_model/scoped_model.dart';

class Preferences extends Model {
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  void toggleTheme() {
    _darkTheme = !_darkTheme;

    notifyListeners();
  }
}
