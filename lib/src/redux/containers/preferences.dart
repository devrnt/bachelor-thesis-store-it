import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:store_it/src/redux/actions/actions.dart';
import 'package:store_it/src/redux/models/app_state.dart';
import 'package:store_it/src/redux/presentation/preferences_screen.dart';
import 'package:store_it/src/selectors/selectors.dart';

class Preferences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.from(store),
      builder: (context, viewmodel) {
        return PreferencesScreen(
          isDarkTheme: viewmodel.isDarkTheme,
          onToggleTheme: viewmodel.onToggleTheme,
        );
      },
    );
  }
}

class _ViewModel {
  final bool isDarkTheme;
  final Function onToggleTheme;

  _ViewModel({
    @required this.isDarkTheme,
    @required this.onToggleTheme,
  });

  factory _ViewModel.from(Store<AppState> store) {
    return _ViewModel(
      isDarkTheme: isDarkThemeSelector(store.state),
      onToggleTheme: () => store.dispatch(ToggleThemeAction()),
    );
  }
}
