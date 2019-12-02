// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Preferences on _Preferences, Store {
  final _$isDarkThemeAtom = Atom(name: '_Preferences.isDarkTheme');

  @override
  bool get isDarkTheme {
    _$isDarkThemeAtom.context.enforceReadPolicy(_$isDarkThemeAtom);
    _$isDarkThemeAtom.reportObserved();
    return super.isDarkTheme;
  }

  @override
  set isDarkTheme(bool value) {
    _$isDarkThemeAtom.context.conditionallyRunInAction(() {
      super.isDarkTheme = value;
      _$isDarkThemeAtom.reportChanged();
    }, _$isDarkThemeAtom, name: '${_$isDarkThemeAtom.name}_set');
  }

  final _$_PreferencesActionController = ActionController(name: '_Preferences');

  @override
  void toggleTheme() {
    final _$actionInfo = _$_PreferencesActionController.startAction();
    try {
      return super.toggleTheme();
    } finally {
      _$_PreferencesActionController.endAction(_$actionInfo);
    }
  }
}
