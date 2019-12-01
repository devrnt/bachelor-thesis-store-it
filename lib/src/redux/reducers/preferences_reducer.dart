import 'package:redux/redux.dart';
import 'package:store_it/src/redux/models/preferences.dart';
import 'package:store_it/src/redux/actions/actions.dart';

final preferencesReducer = combineReducers<Preferences>([
  TypedReducer<Preferences, ToggleThemeAction>(_toggleTheme),
]);

Preferences _toggleTheme(Preferences preferences, ToggleThemeAction action) {
  return Preferences(
    isDarkTheme: !preferences.isDarkTheme,
  );
}
