import 'dart:collection';

import 'package:rxdart/rxdart.dart';
import 'package:store_it/src/blocs/bloc_provider.dart';
import 'package:store_it/src/models/product.dart';

class StoreBloc extends BlocBase {
  var _products = initialProducts;

  final _productsController = BehaviorSubject<List<Product>>();
  Stream<List<Product>> get products => _productsController.stream;

  final _addProductController = BehaviorSubject<Product>();
  Sink<Product> get addProduct => _addProductController.sink;

  final _removeProductController = BehaviorSubject<Product>();
  Sink<Product> get removeProduct => _removeProductController.sink;

  StoreBloc() {
    _productsController.add(UnmodifiableListView<Product>(_products));

    _addProductController.listen(_handleAddProduct);
    _removeProductController.listen(_handleRemoveProduct);
  }

  void _handleAddProduct(Product product) {
    _products.add(product);

    _productsController.add(UnmodifiableListView<Product>(_products));
  }

  void _handleRemoveProduct(Product product) {
    _products.remove(product);

    _productsController.add(UnmodifiableListView<Product>(_products));
  }

  @override
  void dispose() {
    _productsController.close();
    _addProductController.close();
    _removeProductController.close();
  }
}
