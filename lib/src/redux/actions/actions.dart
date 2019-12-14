import 'package:store_it/src/redux/models/product.dart';

class SetProductsAction {
  final List<Product> products;

  SetProductsAction(this.products);
}

class AddProductAction {
  final Product product;

  AddProductAction(this.product);
}

class RemoveProductAction {
  final Product product;

  RemoveProductAction(this.product);
}

class ToggleThemeAction {}
