import 'package:flutter/widgets.dart';
import 'package:store_it/src/models/product.dart';

class Store extends ChangeNotifier {
  var _products = initialProducts;

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);

    notifyListeners();
  }

  void removeProduct(Product product) {
    _products.remove(product);

    notifyListeners();
  }
}
