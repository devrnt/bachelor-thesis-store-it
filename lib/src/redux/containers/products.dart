import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:store_it/src/redux/models/app_state.dart';
import 'package:store_it/src/redux/models/product.dart';
import 'package:store_it/src/selectors/selectors.dart';
import 'package:store_it/src/widgets/product/product_list.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, viewmodel) {
        return ProductList(
          products: viewmodel.products,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Product> products;

  _ViewModel({@required this.products});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(products: productsSelector(store.state));
  }
}
