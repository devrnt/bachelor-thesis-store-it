import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:store_it/src/redux/actions/actions.dart';
import 'package:store_it/src/redux/models/app_state.dart';
import 'package:store_it/src/redux/models/product.dart';
import 'package:store_it/src/redux/presentation/details_screen.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  ProductDetails({@required this.product});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) {
        return _ViewModel.from(store, product);
      },
      builder: (context, viewmodel) {
        return DetailsScreen(
          product: viewmodel.product,
          onRemove: viewmodel.onRemove,
        );
      },
    );
  }
}

class _ViewModel {
  final Product product;
  final Function onRemove;

  _ViewModel({
    @required this.product,
    @required this.onRemove,
  });

  factory _ViewModel.from(Store<AppState> store, Product product) {
    return _ViewModel(
      product: product,
      onRemove: () => store.dispatch(RemoveProductAction(product)),
    );
  }
}
