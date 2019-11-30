import 'package:scoped_model/scoped_model.dart';
import 'package:store_it/src/models/product.dart';

class Store extends Model {
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