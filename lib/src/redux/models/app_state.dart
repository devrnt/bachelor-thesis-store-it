import 'package:flutter/foundation.dart';
import 'package:store_it/src/redux/models/product.dart';

@immutable
class AppState {
  final List<Product> products;

  AppState({this.products = const []});

  factory AppState.initial() => AppState(products: initialProducts);

  AppState copyWith({
    List<Product> products,
  }) {
    return AppState(
      products: products ?? this.products
    );
  }
}
