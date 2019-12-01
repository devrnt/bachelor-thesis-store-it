import 'package:redux/redux.dart';
import 'package:store_it/src/redux/models/product.dart';
import 'package:store_it/src/redux/actions/actions.dart';

final productReducer = combineReducers<List<Product>>([
  TypedReducer<List<Product>, SetProductsAction>(_setProducts),
  TypedReducer<List<Product>, AddProductAction>(_addProduct),
  TypedReducer<List<Product>, RemoveProductAction>(_removeProduct),
]);

List<Product> _setProducts(List<Product> products, SetProductsAction action) {
  return action.products;
}

List<Product> _addProduct(List<Product> products, AddProductAction action) {
  return List.from(products)..add(action.product);
}

List<Product> _removeProduct(
    List<Product> products, RemoveProductAction action) {
  return List.from(products)..remove(action.product);
}