// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductStore on _ProductStore, Store {
  final _$productsAtom = Atom(name: '_ProductStore.products');

  @override
  List<Product> get products {
    _$productsAtom.context.enforceReadPolicy(_$productsAtom);
    _$productsAtom.reportObserved();
    return super.products;
  }

  @override
  set products(List<Product> value) {
    _$productsAtom.context.conditionallyRunInAction(() {
      super.products = value;
      _$productsAtom.reportChanged();
    }, _$productsAtom, name: '${_$productsAtom.name}_set');
  }

  final _$_ProductStoreActionController = ActionController(name: '_ProductStore');

  @override
  void addProduct(Product product) {
    final _$actionInfo = _$_ProductStoreActionController.startAction();
    try {
      return super.addProduct(product);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProduct(Product product) {
    final _$actionInfo = _$_ProductStoreActionController.startAction();
    try {
      return super.removeProduct(product);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }
}
