import 'package:mobx/mobx.dart';
import 'package:store_it/src/models/product.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  @observable
  List<Product> products = initialProducts;

  @action
  void addProduct(Product product) {
    products.add(product);
  }

  @action
  void removeProduct(Product product) {
    products.remove(product);
  }
}
