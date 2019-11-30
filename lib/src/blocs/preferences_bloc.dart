import 'package:rxdart/rxdart.dart';
import 'package:store_it/src/blocs/bloc_provider.dart';

class PreferencesBloc extends BlocBase {
  bool _isDarkTheme = false;

  final _isDarkThemeController = BehaviorSubject<bool>();
  Stream<bool> get isDarkTheme => _isDarkThemeController.stream;

  final _toggleThemeController = BehaviorSubject<void>();
  Sink<void> get toggleTheme => _toggleThemeController.sink;

  PreferencesBloc() {
    _isDarkThemeController.add(_isDarkTheme);

    _toggleThemeController.listen(_handleToggleTheme);
  }

  void _handleToggleTheme(void event) {
    _isDarkTheme = !_isDarkTheme;

    _isDarkThemeController.add(_isDarkTheme);
  }

  @override
  void dispose() {
    _isDarkThemeController.close();
    _toggleThemeController.close();
  }
}
