import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:store_it/src/models/store.dart';
import 'package:store_it/src/widgets/product/product_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<Store>(
      builder: (context, child, model) {
        return ProductList(products: model.products);
      },
    );
  }
}
