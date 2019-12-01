import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:store_it/src/redux/actions/actions.dart';
import 'package:store_it/src/redux/models/app_state.dart';
import 'package:store_it/src/redux/models/product.dart';
import 'package:store_it/src/redux/presentation/add_product_screen.dart';

typedef OnSaveCallback = Function(
  String title,
  String description,
  num price,
  String imageUrl,
);

class AddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnSaveCallback>(
      converter: (store) {
        return (title, description, price, imageUrl) {
          store.dispatch(
            AddProductAction(
              Product(
                title: title,
                description: description,
                price: price,
                imageUrl: imageUrl,
              ),
            ),
          );
        };
      },
      builder: (context, onSave) {
        return AddProductScreen(onSave: onSave);
      },
    );
  }
}
