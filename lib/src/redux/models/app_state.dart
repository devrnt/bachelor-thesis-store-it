import 'package:flutter/foundation.dart';
import 'package:store_it/src/redux/models/preferences.dart';
import 'package:store_it/src/redux/models/product.dart';

@immutable
class AppState {
  final List<Product> products;
  final Preferences preferences;

  AppState({this.products = const [], this.preferences});

  factory AppState.initial() => AppState(
        products: initialProducts,
        preferences: Preferences(isDarkTheme: false),
      );

  AppState copyWith({
    List<Product> products,
    Preferences preferences,
  }) {
    return AppState(
      products: products ?? this.products,
      preferences: preferences ?? this.preferences,
    );
  }
}
